//
//  Recipe.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/15/25.
//

import SwiftUI

struct Recipe: Identifiable, Decodable {
    var id: String?
    var cuisine: String?
    var name: String?
    var photo_url_large: String?
    var photo_url_small: String?
    var source_url: String?
    var youtube_url: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case cuisine = "cuisine"
        case name = "name"
        case photo_url_large = "photo_url_large"
        case photo_url_small = "photo_url_small"
        case source_url = "source_url"
        case youtube_url = "youtube_url"
    }
                        
}
