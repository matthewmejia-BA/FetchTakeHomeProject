//
//  Recipe.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/15/25.
//

import SwiftUI

struct Recipe: Identifiable, Decodable {
    var id: UUID
    var cuisine: String?
    var name: String?
    var photo_url_large: String?
    var photo_url_small: String?
    var source_url: String?
    var youtube_url: String?
}
