//
//  ImageView.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/19/25.
//

import SwiftUI

struct ImageView: View {
    var url: URL?
    
    //TODO: Create caching of images
    
    var body: some View {
        if let url {
            AsyncImage(
                url: url
            ) { image in
                switch image {
                case .empty:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: 50,
                            height: 50,
                            alignment: .center
                        )
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: 50,
                            height: 50,
                            alignment: .center
                        )
                        .clipped()
                        .cornerRadius(5)
                case .failure(let error):
                    VStack {
                        Image(systemName: "x.circle")
                            .foregroundStyle(.red)
                        Text(String(describing: error))
                    }
                @unknown default:
                    Text("Unknown error occured")
                }
            }
        }
    }
}
