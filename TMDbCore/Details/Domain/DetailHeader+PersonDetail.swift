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
        //backdropPath = movie.backdropPath
        
        let releaseDate = person.birthday.flatMap { dateFormatter.date(from: $0)}
        let year = (releaseDate?.year).map { String($0) }
        //let duration = "\(movie.runtime) min."
        
       // metadata = [year, duration].flatMap { $0 }.joined(separator: " - ")
       // TODO
    }
}
