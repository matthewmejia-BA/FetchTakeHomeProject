//
//  RecipeDataService.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/15/25.
//
import SwiftUI

enum DecodingError: Error {
    case malformedJson
}

class RecipeDataService {
    
    // Call from view model
    static func getRecipes() async throws -> [Recipe] {
        
        let url = Constants.prodDataURL
        
        var recipes: [Recipe] = []
        
        let session = URLSession(configuration: .default)
        
        do {
            if let url {
                let (data, _) = try await session.data(from: url)
                let decoder = JSONDecoder()
                let recipeData = try decoder.decode(RecipeData.self, from: data)
                print(recipeData)
                recipes = recipeData.recipes
            }
        } catch {
            throw(DecodingError.malformedJson)
        }
        return recipes
    }
}
