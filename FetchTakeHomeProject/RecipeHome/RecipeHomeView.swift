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
            if searchQuery.isEmpty && selectedCuisines == "All" {
                return recipes
            } else if !searchQuery.isEmpty {
                let filteredResults = recipes.filter(
                    {$0.name.contains(searchQuery)
                    })
                return filteredResults
            } else {
                let filteredResults = recipes.filter(
                    { $0.cuisine.contains(selectedCuisines)
                    })
                return filteredResults
            }
        case .failed:
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
                    if searchResults.isEmpty {
                        EmptyRecipesView()
                    } else {
                        if searchQuery.isEmpty {
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
                        }
                        
                        List(searchResults) { recipe in
                            HStack(spacing: 10) {
                                if let smallImageURL = recipe.photo_url_small {
                                    AsyncImage(
                                        url: URL(string: smallImageURL)
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
                                
                                VStack(alignment: .leading) {
                                    
                                    Text(recipe.name)
                                        .bold()
                                    
                                    
                                    Text(recipe.cuisine)
                                        .font(.caption)
                                }
                            }
                        }
                        .searchable(text: $searchQuery)
                       // .disabled(selectedCuisines != "All")
                    }
                case .failed(let error):
                    RecipeErrorView(errorMessage: error)
                    
                default:
                    ProgressView()
                }
            }
            .navigationTitle("Recipes")
            .task {
                await recipeViewModel.getRecipes()
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
}
