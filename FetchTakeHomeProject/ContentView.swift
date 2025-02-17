//
//  ContentView.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/15/25.
//

import SwiftUI
import Algorithms

struct ContentView: View {
    
    private let recipeViewModel = RecipeViewModel()
    private var randomRecipes: [Recipe] {
        var recipes: [Recipe] = []
        recipes = recipeViewModel.recipes.randomSample(count: 3)
        return recipes
    }
    @State private var selectedCuisines: String = "All"
    private var searchResults: [Recipe] {
        if searchQuery.isEmpty && selectedCuisines == "All" {
            return recipeViewModel.recipes
        } else {
            let filteredName = recipeViewModel.recipes.filter({$0.name!.contains(searchQuery)})
            
            let filteredCuisines = recipeViewModel.recipes.filter({$0.cuisine!.contains(selectedCuisines)})
            
            let searchResult: [Recipe] = filteredName + filteredCuisines
            
            return searchResult
        }
    }
    @State private var searchQuery: String = ""
    @State private var tabSelectionIndex = 0
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
//                TabView(selection: $tabSelectionIndex) {
//                    ForEach(randomRecipes) {
//                        recipe in
//                        VStack {
//                            if let largePhotoURL = recipe.photo_url_large {
//                                AsyncImage(url: largePhotoURL) { image in
//                                    switch image {
//                                    case .empty:
//                                        Image(systemName: "photo")
//                                            .resizable()
//                                            .scaledToFill()
//                                            .frame(width: 50, height: 50, alignment: .center)
//                                    case .success(let image):
//                                        image
//                                            .resizable()
//                                            .scaledToFill()
//                                            .frame(width: 250, height: 250, alignment: .center)
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
//                            if let name = recipe.name {
//                                Text(name)
//                                    .bold()
//                            }
//                            HStack {
//                                if let youtubeURL = recipe.youtube_url {
//                                    Link(destination: youtubeURL) {
//                                        Text("Open in Youtube")
//                                    }
//                                }
//                                if let sourceURL = recipe.source_url {
//                                    Link(destination: sourceURL) {
//                                        Text("See recipe")
//                                    }
//                                }
//                                
//                            }
//                        }
//                    }
//                }
//                .tabViewStyle(.page(indexDisplayMode: .always))
//                .indexViewStyle(.page(backgroundDisplayMode: .always))
                ScrollView(.horizontal) {
                    HStack {
                        Picker("Cuisine Types", selection: $selectedCuisines) {
                            ForEach(recipeViewModel.cuisineTypes, id: \.self) {cuisine in
                                Text(cuisine)
                                    .tag(cuisine)
                            }
                        }
                    }
                }
                .padding(.horizontal)
             
                List(searchResults) { recipe in
                    HStack {
                        if let smallImageURL = recipe.photo_url_small {
                            AsyncImage(url: smallImageURL) { image in
                                switch image {
                                case .empty:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                    
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
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
                            if let name = recipe.name {
                                Text(name)
                                    .bold()
                            }
                            if let cuisine = recipe.cuisine {
                                Text(cuisine)
                                    .font(.caption)
                            }
                        }
                    }
                }
                .searchable(text: $searchQuery)
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
    ContentView()
}
