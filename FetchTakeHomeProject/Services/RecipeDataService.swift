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

enum ResponseError: Error {
    case badURL
}

class RecipeDataService {
    
    // Call from view model
    static func getRecipes() async throws -> [Recipe] {
        
        let url = Constants.prodDataURL
        
        var recipes: [Recipe] = []
        
        let session = URLSession(configuration: .default)
        
        do {
            if let url {
                let (data, response) = try await session.data(from: url)
                guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                    throw ResponseError.badURL
                }
                let decoder = JSONDecoder()
                let recipeData = try decoder.decode(RecipeData.self, from: data)
                recipes = recipeData.recipes
                print(recipes)
            }
        } catch {
            throw(DecodingError.malformedJson)
        }
        return recipes
    }
}
