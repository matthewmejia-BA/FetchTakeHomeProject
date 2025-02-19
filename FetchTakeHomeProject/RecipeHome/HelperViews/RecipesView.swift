//
//  RecipesView.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/19/25.
//

import SwiftUI

struct RecipesView: View {
    
    var recipes: [Recipe]
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(recipes) { recipe in
                RecipeRowView(recipe: recipe)
            }
        }
        .safeAreaPadding(.horizontal)
    }
}
