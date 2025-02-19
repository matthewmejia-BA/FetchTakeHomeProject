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
    
    enum Status {
        case success([Recipe])
        case empty([Recipe])
        case failed(String)
    }
    
    var recipeStatus: Status?
    var errorMessage = ""
    var cuisineTypes: [String] {
        switch recipeStatus {
        case .success(let recipes):
            let mappedCuisines = recipes.map({ $0.cuisine })
            var cuisines: Set<String> = ["All"]
                for cuisine in mappedCuisines {
                        cuisines.insert(cuisine)
                }
            return cuisines.sorted()
        default:
            return []
        }
    }
    
    func getRecipes() async {
        guard recipeStatus == nil else { return }
        
        do {
            let foundRecipes = try await RecipeDataService.getRecipes()
            if foundRecipes.isEmpty {
                recipeStatus = .empty([])
            } else { recipeStatus = .success(foundRecipes) }
        } catch(let error as DecodingError)  {
            recipeStatus = .failed(error.localizedDescription)
        } catch {
            recipeStatus = .failed("Unknown error occured")
        }
    }
}
