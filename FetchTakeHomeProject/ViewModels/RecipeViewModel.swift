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
//    {
//        var cuisinesTypes: [String] = []
//        
//        let cuisines = recipes.map { $0.cuisine }
//        
//        for cuisine in cuisines {
//            if !cuisinesTypes.contains( where: {$0 == cuisine} ) {
//                cuisinesTypes.append(cuisine!)
//            }
//        }
//        return cuisinesTypes
//    }
    
    func getRecipes() async {
       recipes = await RecipeDataService.getRecipes()
        
        let cuisines = recipes.map({ $0.cuisine })
        print(cuisines)
        for cuisine in cuisines {
            if !cuisineTypes.contains( where: {$0 == cuisine} ) {
                cuisineTypes.append(cuisine!)
            }
        }
    }
}
