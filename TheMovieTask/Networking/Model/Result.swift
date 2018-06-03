//
//  Result.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 03/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import Foundation

public enum Result<V, E: Error> {
    case success(V)
    case failure(E)
}
