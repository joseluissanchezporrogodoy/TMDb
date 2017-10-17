//
//  DetailHeader+PersonDetail.swift
//  TMDbCore
//
//  Created by jose luis sanchez-porro godoy on 12/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation


extension DetailHeader {
    init(person: PersonDetail, dateFormatter: DateFormatter) {
        title = person.name
        posterPath = person.profilePath
        if 0 != person.taggedImages?.results.count{
            backdropPath = person.taggedImages?.results[0].filePath
        }else{
            backdropPath = nil
        }
        metadata = nil
    }
}
