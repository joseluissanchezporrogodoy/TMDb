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
        identifier = image.media.identifier
        mediaType = nil
        title = image.media.name
        metadata = nil
        posterPath = image.filePath
    }
}
