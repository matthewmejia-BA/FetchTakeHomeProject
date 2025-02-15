//
//  FetchTakeHomeProjectApp.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/15/25.
//

import SwiftUI

@main
struct FetchTakeHomeProjectApp: App {
    @State private var recipeViewModel = RecipeViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(recipeViewModel)
        }
    }
}
