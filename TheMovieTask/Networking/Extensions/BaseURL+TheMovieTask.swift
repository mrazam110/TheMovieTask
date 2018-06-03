//
//  BaseURL+TheMovieTask.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 03/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import UIKit

extension BaseURL {
    public static var themoviedb: BaseURL { return BaseURL(scheme: "https", host: "api.themoviedb.org") }
    public static var poster: BaseURL { return BaseURL(scheme: "https", host: "image.tmdb.org") }
}
