//
//  RecipeRow.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/19/25.
//

import SwiftUI

struct RecipeRowView: View {
    
    @Environment(\.colorScheme) var colorScheme
    var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                
                ImageView(url: recipe.photo_url_small)
                
                VStack(alignment: .leading) {
                    
                    Text(recipe.name)
                        .bold()
                    
                    Text(recipe.cuisine)
                        .font(.caption)
                }
                Spacer()
                
                VStack {
                    if let youtube_url = recipe.youtube_url {
                        Link(destination: youtube_url) {
                            Image(systemName: "play.rectangle.fill")
                                .logoModifier()
                                .foregroundStyle(.red)
                        }
                    }
                    if let source_url = recipe.source_url {
                        Link(destination: source_url) {
                            Image(systemName: "safari")
                                .logoModifier()
                                .foregroundStyle(.blue)
                        }
                    }
                }
            }
            .foregroundStyle(.black)
            .padding()
            .background(colorScheme == .dark ? .gray: . white)
            .cornerRadius(12)
            .shadow(color: colorScheme == .dark ? .white.opacity(0.25) : .black.opacity(0.25), radius: 3, x: 0, y: 1)
        }
    }
}
