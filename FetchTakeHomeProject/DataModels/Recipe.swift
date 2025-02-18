//
//  Recipe.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/15/25.
//

import SwiftUI

struct Recipe: Identifiable, Codable {
    var id: UUID
    var cuisine: String
    var name: String
    var photo_url_large: String?
    var photo_url_small: String?
    var source_url: String?
    var youtube_url: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case cuisine = "cuisine"
        case name = "name"
        case photo_url_large = "photo_url_large"
        case photo_url_small = "photo_url_small"
        case source_url = "source_url"
        case youtube_url = "youtube_url"
    }
}

extension Recipe {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(UUID.self, forKey: .id)
        cuisine = try values.decode(String.self, forKey: .cuisine)
        name = try values.decode(String.self, forKey: .name)
        photo_url_large = try values.decode(String.self, forKey: .photo_url_large)
        photo_url_small = try values.decode(String.self, forKey: .photo_url_small)
        source_url = try values.decodeIfPresent(String.self, forKey: .source_url)
        youtube_url = try values.decodeIfPresent(String.self, forKey: .youtube_url)
    }
}
