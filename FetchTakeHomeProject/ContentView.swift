//
//  ContentView.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/15/25.
//

import SwiftUI

struct ContentView: View {
    
    private let recipeViewModel = RecipeViewModel()
    
    var body: some View {
        VStack {
            List(recipeViewModel.recipes) { recipe in
                        if let name = recipe.name {
                            Text(name)
                        }
                    }
        }
        .task {
            await recipeViewModel.getRecipes()
        }
    }
}

#Preview {
    ContentView()
}
