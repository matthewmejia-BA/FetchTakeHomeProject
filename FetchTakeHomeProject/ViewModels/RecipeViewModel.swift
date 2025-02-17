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
    var cuisineTypes: [String] = ["All"]
    
    func getRecipes() async {
        recipes = await RecipeDataService.getRecipes()
        
        var cuisines = recipes.map({ $0.cuisine })
        
        //TODO: Replace force unwrap
        cuisines.sort(by: {$0! < $1!} )
        for cuisine in cuisines {
            if !cuisineTypes.contains( where: {$0 == cuisine} ) {
                cuisineTypes.append(cuisine!)
            }
        }
    }
}
