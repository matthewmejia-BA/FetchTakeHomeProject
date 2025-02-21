//
//  EmptyRecipesView.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/18/25.
//

import SwiftUI

struct EmptyRecipesView: View {
    
    var recipeViewModel: RecipeViewModel
    private let plainText = AttributedString("No recipes available. Please check back soon or ")
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "square.stack.3d.up.slash.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text(plainText)
            Button("refresh the page") {
                Task {
                    await recipeViewModel.getRecipes()
                }
            }
            .foregroundStyle(.blue)
        }
        .multilineTextAlignment(.center)
    }
}
