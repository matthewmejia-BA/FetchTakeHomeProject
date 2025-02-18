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
        
        //TODO: Remove force unwrap
        if searchQuery.isEmpty && selectedCuisines == "All" {
            return recipeViewModel.recipes
        } else if !searchQuery.isEmpty {
            let filteredResults = recipeViewModel.recipes.filter({$0.name.contains(searchQuery)})
            return filteredResults
        } else {
            let filteredResults = recipeViewModel.recipes.filter({ $0.cuisine.contains(selectedCuisines)})
            return filteredResults
        }
    }
    
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading, spacing: 5) {
                if !recipeViewModel.errorMessage.isEmpty {
                    RecipeErrorView()
                } else if searchResults.isEmpty {
                    EmptyRecipesView()
                } else {
                    if searchQuery.isEmpty {
                        HStack(spacing: 5) {
                            Text("Cuisine Type:")
                            Picker("", selection: $selectedCuisines) {
                                ForEach(recipeViewModel.cuisineTypes, id: \.self) {cuisine in
                                    Text(cuisine)
                                        .tag(cuisine)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
//                    List(searchResults) { recipe in
//                        HStack(spacing: 10) {
//                            if let smallImageURL = recipe.photo_url_small {
//                                AsyncImage(url: smallImageURL) { image in
//                                    switch image {
//                                    case .empty:
//                                        Image(systemName: "photo")
//                                            .resizable()
//                                            .scaledToFill()
//                                            .frame(width: 50, height: 50, alignment: .center)
//                                        
//                                    case .success(let image):
//                                        image
//                                            .resizable()
//                                            .scaledToFill()
//                                            .frame(width: 50, height: 50, alignment: .center)
//                                            .clipped()
//                                            .cornerRadius(5)
//                                    case .failure(let error):
//                                        VStack {
//                                            Image(systemName: "x.circle")
//                                                .foregroundStyle(.red)
//                                            Text(String(describing: error))
//                                        }
//                                    @unknown default:
//                                        Text("Unknown error occured")
//                                    }
//                                }
//                            }
//                            
//                            VStack(alignment: .leading) {
//                                
//                                Text(recipe.name)
//                                    .bold()
//                                
//                                
//                                Text(recipe.cuisine)
//                                    .font(.caption)
//                            }
//                        }
//                    }
//                    .searchable(text: $searchQuery).disabled(selectedCuisines != "All")
                }
            }
            .navigationTitle("Recipes")
        }
        .task {
            await recipeViewModel.getRecipes()
        }
        .refreshable {
            Task {
                await recipeViewModel.getRecipes()
            }
        }
    }
}

#Preview {
    RecipeHomeView()
}
