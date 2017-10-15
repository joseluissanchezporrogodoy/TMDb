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
        //let identifier: Int64
        let filePath: String
        
        private enum CodingKeys: String, CodingKey {
            //case identifier = "id"
            case filePath = "file_path"
        }
    }
    
    
    let results: [Image]
    
}
