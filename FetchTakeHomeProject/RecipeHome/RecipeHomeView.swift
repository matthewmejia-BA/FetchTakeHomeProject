//
//  ContentView.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/15/25.
//

import SwiftUI
import Algorithms

struct RecipeHomeView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(RecipeViewModel.self) private var recipeViewModel
    @State private var selectedCuisines: String = "All"
    @State private var searchQuery: String = ""
    @State private var showRandomRecipe = false
    
    private var searchResults: [Recipe] {
        switch recipeViewModel.recipeStatus {
        case .success (let recipes):
            // Filter recipes based on searchQuery and selectedCuisine type
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
            VStack(alignment: .leading, spacing: 0) {
                switch recipeViewModel.recipeStatus {
                case .success:
                    if showRandomRecipe {
                        RandomRecipeView(recipe: searchResults.randomElement()!)
                    } else {
                        VStack(alignment: .leading, spacing: 0) {
                            FilterCuisinesMenu(selectedCuisines: $selectedCuisines, cuisinesTypes: recipeViewModel.cuisineTypes)
                            Spacer()
                            if !searchResults.isEmpty {
                                RecipesView(recipes: searchResults)
                            } else {
                                Text("No recipes found. Try another search.")
                            }
                        }
                    }
                    
                case .failed(let error):
                    RecipeErrorView(errorMessage: error)
                    
                case .empty:
                    EmptyRecipesView(recipeViewModel: recipeViewModel)
                    
                default:
                    ProgressView()
                }
            }
            .searchable(text: $searchQuery)
            .task {
                await recipeViewModel.getRecipes()
            }
            .safeAreaInset(edge: .bottom) {
                //TODO: Fix color grading between dark and light mode
                Rectangle()
                    .fill(LinearGradient(
                        colors: colorScheme == .dark ? [.black, .black.opacity(0)] : [.white, .white.opacity(0)],
                        startPoint: .bottom,
                        endPoint: .top))
                    .frame(height: 90)
                    .padding(.bottom, 50)
            }
            .edgesIgnoringSafeArea(.bottom)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Recipes")
                        .font(.title)
                        .bold()
                        .safeAreaPadding(.horizontal, 5)
                        .safeAreaPadding([.top, .bottom])
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showRandomRecipe.toggle()
                    } label: {
                        //Image(systemName: "shuffle.circle")
                        Text(showRandomRecipe ? "Back to list" : "Random")
                    }
                }
            }
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
        .environment(RecipeViewModel())
}
