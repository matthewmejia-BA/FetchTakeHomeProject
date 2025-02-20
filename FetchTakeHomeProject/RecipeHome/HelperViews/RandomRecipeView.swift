//
//  RandomRecipeView.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/20/25.
//

import SwiftUI

struct RandomRecipeView: View {
    
    @Environment(\.colorScheme) var colorScheme
    var recipe: Recipe
    
    var body: some View {
            GeometryReader { geo in
                ZStack {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? .gray : .white)
                    
                    VStack(spacing: 0) {
                        ImageView(url: recipe.photo_url_large)
                        
                        HStack(spacing: 25) {
                            VStack(alignment: .leading) {
                                
                                Text(recipe.name)
                                    .font(.title2)
                                
                                Text(recipe.cuisine)
                                    .font(.body)
                            }
                            
                            URLLinksView(youtubeURL: recipe.youtube_url, sourceURL: recipe.source_url)
                        }
                    }
                }
                .frame(width: geo.size.width - 35, height: geo.size.height - 100, alignment: .center)
                .cornerRadius(15)
                .shadow(color: .black, radius: 10, x: -5, y: 5)
                .safeAreaPadding(.horizontal)
            }
    }
}
