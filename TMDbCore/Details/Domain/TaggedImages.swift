//
//  TaggedImages.swift
//  TMDbCore
//
//  Created by jose luis sanchez-porro godoy on 15/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct TaggedImages: Decodable {
    struct Image: Decodable {
        struct TIMediaInfo: Decodable {
            let identifier: Int64
            let name: String
            private enum CodingKeys: String, CodingKey {
                case identifier = "id"
                case name = "title"
                
            }
        }
        let filePath: String
        let media: TIMediaInfo
        private enum CodingKeys: String, CodingKey {
            case filePath = "file_path"
            case media
        }
    }
    
    
    let results: [Image]
    
}
