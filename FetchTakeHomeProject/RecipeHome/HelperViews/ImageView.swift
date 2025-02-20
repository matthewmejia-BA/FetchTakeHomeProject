//
//  ImageView.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/19/25.
//

import SwiftUI

struct ImageView: View {
    var url: URL?
    @State private var image = UIImage()
    
    var body: some View {
        
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(
                width: 50,
                height: 50,
                alignment: .center
            )
            .task {
                loadImage()
            }
    }
    
    func loadImage() {
        guard let url = url else { return }
        Task {
            let (imageData, _) = try await URLSession.shared.data(from: url)
            image = UIImage(data: imageData)!
        }
    }
}
