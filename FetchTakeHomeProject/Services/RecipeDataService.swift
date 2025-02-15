//
//  RecipeDataService.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/15/25.
//
import SwiftUI

class RecipeDataService {
    
    // Call from view model
    static func getRecipes() async throws {
        
        let url = URL(string:  "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")
        
        do {
            if let url {
                let (data, response) = try await URLSession.shared.data(from: url)
            }
        } catch {
            //TODO: Set up networking error
            print(error)
        }
        
    }
}
