//
//  PosterStripItem+TaggedImages.swift
//  TMDbCore
//
//  Created by jose luis sanchez-porro godoy on 15/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation
extension PosterStripItem {
    init(image: TaggedImages.Image) {
        identifier = 0
        mediaType = nil
        title = nil
        metadata = nil
        posterPath = image.filePath
    }
}
