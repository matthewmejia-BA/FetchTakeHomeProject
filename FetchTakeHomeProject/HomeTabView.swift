//
//  HomeTabView.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/19/25.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        
        if #available(iOS 18.0, *) {
            TabView {
                Tab("Home", systemImage: "house") {
                    RecipeHomeView()
                }
               
            }
        } else {
            TabView {
                RecipeHomeView()
                    .tabItem {
                        Image(systemName: "house")
                    }
            }
        }
    }
}

