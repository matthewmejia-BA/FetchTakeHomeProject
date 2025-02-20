//
//  ImageExtension.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/20/25.
//
import SwiftUI

extension Image {
    
    func smallPhotoModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .frame(
                width: 75,
                height: 75,
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
