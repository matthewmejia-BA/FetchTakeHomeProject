//
//  ImageView.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/19/25.
//

/// I wanted to use AsyncImage instead of UIImage, but it seemed it doesn't quite support caching. I referenced this https://matteomanferdini.com/swiftui-asyncimage/ and created seperate data url from the json to pass into AsyncImage. After checking Proxyman, there were no additional network requests when refreshing the page or relaunching the app.
///
import SwiftUI

struct ImageView: View {
    var url: URL?
    @State private var dataURL = URL(string: "")
    
    var body: some View {
        VStack {
            AsyncImage(url: dataURL) { phase in
                switch phase {
                case .empty:
                    Image(systemName: "photo")
                        .smallPhotoModifier()
                case .success(let image):
                    image
                        .smallPhotoModifier()
                case .failure:
                    Image(systemName: "exclamationmark.triangle")
                        .smallPhotoModifier()
                default:
                    ProgressView()
                }
            }
            .task {
                loadImage()
            }
        }
    }
    
    func loadImage() {
        guard let url = url else { return }
        Task {
            let (imageData, _) = try await URLSession.shared.data(from: url)
            dataURL = URL(string: "data:image/png;base64," + imageData.base64EncodedString())
        }
    }
}
