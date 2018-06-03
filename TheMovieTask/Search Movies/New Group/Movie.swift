//
//  Movie.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 03/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import Foundation

struct Movie: DTO {
    let poster: String?
    let name: String
    let releaseDate: String
    let overview: String
    let backdrop: String?
    
    enum CodingKeys: String, CodingKey {
        case poster = "poster_path"
        case name = "title"
        case releaseDate = "release_date"
        case overview = "overview"
        case backdrop = "backdrop_path"
    }
}
