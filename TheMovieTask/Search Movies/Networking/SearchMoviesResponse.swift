//
//  SearchMoviesResponse.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 04s/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import Foundation

public struct SearchMoviesResponse: DTO {
    let page: Int
    let totalResult: Int
    let totalPages: Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResult = "total_results"
        case totalPages = "total_pages"
        case movies = "results"
    }
}
