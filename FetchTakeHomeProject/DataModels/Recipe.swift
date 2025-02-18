//
//  Recipe.swift
//  FetchTakeHomeProject
//
//  Created by BrilyanteApps on 2/15/25.
//

import SwiftUI

struct Recipe: Identifiable {
    var id: UUID
    var cuisine: String
    var name: String
    var photo_url_large: URL
    var photo_url_small: URL
    var source_url: URL
    var youtube_url: URL
}

extension Recipe: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case cuisine = "cuisine"
        case name = "name"
        case photo_url_large = "photo_url_large"
        case photo_url_small = "photo_url_small"
        case source_url = "source_url"
        case youtube_url = "youtube_url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawID = try? values.decode(UUID.self, forKey: .id)
        let rawCuisine = try? values.decode(String.self, forKey: .cuisine)
        let rawName = try? values.decode(String.self, forKey: .name)
        let rawPhotoURLLarge = try? values.decode(URL.self, forKey: .photo_url_large)
        let rawPhotoURLSmall = try? values.decode(URL.self, forKey: .photo_url_small)
        let rawSourceURL = try? values.decode(URL.self, forKey: .source_url)
        let rawYoutubeURL = try? values.decode(URL.self, forKey: .youtube_url)
        
        
        guard let id = rawID,
              let cuisine = rawCuisine,
              let name = rawName,
              let photo_url_large = rawPhotoURLLarge,
              let photo_url_small = rawPhotoURLSmall,
              let source_url = rawSourceURL,
              let youtube_url = rawYoutubeURL
                
        else {
            throw(JSONError.missingData)
        }
        
        self.id = id
        self.cuisine = cuisine
        self.name = name
        self.photo_url_large = photo_url_large
        self.photo_url_small = photo_url_small
        self.source_url = source_url
        self.youtube_url = youtube_url
    }
}

enum JSONError: Error {
    case missingData
}
