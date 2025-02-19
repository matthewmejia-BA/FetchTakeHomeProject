//
//  RecipeRow.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/19/25.
//

import SwiftUI

struct RecipeRowView: View {
    
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
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.25), radius: 3, x: 0, y: 1)
        }
    }
}
