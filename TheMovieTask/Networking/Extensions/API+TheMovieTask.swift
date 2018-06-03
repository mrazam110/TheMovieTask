//
//  API+TheMovieTask.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 03/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import Foundation

extension API {
    
    public static let searchMovie = API.init(baseURL: .themoviedb,
                                            path: ["3", "search", "movie"])
    public static let poster = API.init(baseURL: .poster,
                                             path: ["t", "p", "w92"])
}
