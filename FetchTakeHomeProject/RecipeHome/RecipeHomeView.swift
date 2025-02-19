//
//  ContentView.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/15/25.
//

import SwiftUI
import Algorithms

struct RecipeHomeView: View {
    
    @Environment(RecipeViewModel.self) private var recipeViewModel
    @State private var selectedCuisines: String = "All"
    @State private var searchQuery: String = ""
    
    private var searchResults: [Recipe] {
        switch recipeViewModel.recipeStatus {
        case .success (let recipes):
            let filteredRecipes = recipes.filter { recipe in
                let matchesSearch = searchQuery.isEmpty ||
                recipe.name.localizedCaseInsensitiveContains(searchQuery)
                let matchesCuisine = selectedCuisines == "All" ||
                recipe.cuisine == selectedCuisines
                
                return matchesSearch && matchesCuisine
            }
            return filteredRecipes
        case .empty:
            return []
        default:
            return []
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 5) {
                switch recipeViewModel.recipeStatus {
                case .success:
                    VStack(spacing: 0) {
                        HStack(spacing: 5) {
                            Text("Cuisine Type:")
                            Picker("", selection: $selectedCuisines) {
                                ForEach(
                                    recipeViewModel.cuisineTypes,
                                    id: \.self
                                ) {cuisine in
                                    Text(cuisine)
                                        .tag(cuisine)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                        if !searchResults.isEmpty {
                            RecipesView(recipes: searchResults)
                        } else {
                            Text("No recipes found. Try another search.")
                        }
                    }
                    
                    
                case .failed(let error):
                    RecipeErrorView(errorMessage: error)
                    
                case .empty:
                    EmptyRecipesView()
                    
                default:
                    ProgressView()
                }
            }
            .searchable(text: $searchQuery)
            .navigationTitle("Recipes")
            .task {
                await recipeViewModel.getRecipes()
            }
            .safeAreaInset(edge: .bottom) {
                //TODO: Fix color grading between dark and light mode
                Rectangle()
                    .fill(LinearGradient(colors: [.white, .white.opacity(0)],
                                         startPoint: .bottom,
                                         endPoint: .top))
                    .frame(height: 90)
                    .padding(.bottom, 50)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .refreshable {
            Task {
                await recipeViewModel.getRecipes()
                recipeViewModel.errorMessage = ""
            }
        }
    }
}

#Preview {
    RecipeHomeView()
}
