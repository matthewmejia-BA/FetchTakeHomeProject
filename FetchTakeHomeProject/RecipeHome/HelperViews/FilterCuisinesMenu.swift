//
//  Untitled.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/19/25.
//

import SwiftUI

struct FilterCuisinesMenu: View {
    @Binding var selectedCuisines: String
    var cuisinesTypes: [String]
    
    var body: some View {
        HStack {
            Text("Filter cuisines: ")
                .foregroundStyle(.black)
            Menu {
                ForEach(cuisinesTypes, id: \.self) { cuisine in
                    Button {
                        selectedCuisines = cuisine
                    } label: {
                        HStack {
                            Text(cuisine)
                        }
                    }
                }
            } label: {
                HStack(spacing: 0) {
                    Text(selectedCuisines)
                    Image(systemName: "chevron.down")
                }
            }
        }
        .padding(.horizontal)
    }
}
