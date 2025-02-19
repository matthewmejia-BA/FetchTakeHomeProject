//
//  HomeTabView.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/19/25.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                RecipeHomeView()
            }
        }
    }
}
