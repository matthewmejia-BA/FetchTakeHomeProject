//
//  RecipeDataService.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/15/25.
//
import SwiftUI

class RecipeDataService {
    
    // Call from view model
    static func getRecipes() async -> [Recipe] {
        
        let url = URL(string:  "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")
        var recipes: [Recipe] = []
        
        do {
            if let url {
                
                let (data, response) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                
                let recipeData = try decoder.decode(RecipeData.self, from: data)
                    
                if let foundRecipes = recipeData.recipes {
                    recipes = foundRecipes
                }
            }
            
        } catch {
            //TODO: Set up networking error
            print(error)
        }
        
        return recipes
    }
}
