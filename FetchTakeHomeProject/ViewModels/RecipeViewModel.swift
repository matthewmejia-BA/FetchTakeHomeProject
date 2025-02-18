//
//  RecipeViewModel.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/15/25.
//

import SwiftUI

@MainActor
@Observable
final class RecipeViewModel {
    
    var recipes: [Recipe] = []
    var errorMessage = ""
    var cuisineTypes: [String] {
        let mappedCuisines = recipes.map({ $0.cuisine })
        var cuisines: Set<String> = ["All"]
            for cuisine in mappedCuisines {
                    cuisines.insert(cuisine)
            }
        return cuisines.sorted()
    }
    
    func getRecipes() async {
        do {
            let foundRecipes = try await RecipeDataService.getRecipes()
            recipes = foundRecipes
        } catch(let error as DecodingError) {
            errorMessage = error.localizedDescription
        } catch {
            print("unknown error")
        }
    }
}
