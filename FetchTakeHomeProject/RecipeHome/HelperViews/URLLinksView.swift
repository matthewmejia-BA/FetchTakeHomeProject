//
//  URLLinksView.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/20/25.
//

import SwiftUI

struct URLLinksView: View {
    
    var youtubeURL: URL?
    var sourceURL: URL?
    
    var body: some View {
        VStack{
            if let youtube_url = youtubeURL {
                Link(destination: youtube_url) {
                    Image(systemName: "play.rectangle.fill")
                        .logoModifier()
                        .foregroundStyle(.red)
                }
            }
            if let source_url = sourceURL {
                Link(destination: source_url) {
                    Image(systemName: "safari")
                        .logoModifier()
                        .foregroundStyle(.blue)
                }
            }
        }

    }
}
