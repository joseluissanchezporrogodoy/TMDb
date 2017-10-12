//
//  PersonDetail.swift
//  TMDbCore
//
//  Created by jose luis sanchez-porro godoy on 12/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct PersonDetail: Decodable {
    let identifier: Int64
    let name: String
    let birthday: String?
    let biography: String?
    let profilePath: String?

    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case birthday
        case biography
        case profilePath = "profile_path"
    }
}
