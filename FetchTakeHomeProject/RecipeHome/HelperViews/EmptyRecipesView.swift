//
//  EmptyRecipesView.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/18/25.
//

import SwiftUI

struct EmptyRecipesView: View {
    
    private var tappableText = AttributedString("refresh the page")
    private var plainText = AttributedString("No recipes available. Please check back soon or ")
    
    init() {
        tappableText.foregroundColor = .blue
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text(plainText + tappableText)
        }
    }
}
