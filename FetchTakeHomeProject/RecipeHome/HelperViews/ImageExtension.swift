//
//  ImageExtension.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/20/25.
//
import SwiftUI

extension Image {
    
    func photoModifier(large: Bool) -> some View {
        self
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .frame(
                width: large ? 300 : 75,
                height: large ? 400 : 75,
                alignment: .center
            )
    }
    
    func logoModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .frame(
                width: 25,
                height: 25,
                alignment: .center
            )
    }
}
