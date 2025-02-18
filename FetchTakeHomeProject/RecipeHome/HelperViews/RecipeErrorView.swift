//
//  RecipeErrorView.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/18/25.
//

import SwiftUI

struct RecipeErrorView: View {
    var errorMessage: String
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("We've encountered an error: \(errorMessage).")
            Text("Thank you for your patience as we work hard to resolve this issue.")
                
        }
        .multilineTextAlignment(.center)
        .padding(.horizontal)
    }
}
