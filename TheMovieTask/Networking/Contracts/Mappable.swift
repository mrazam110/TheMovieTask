//
//  Mappable.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 02/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import Foundation

public protocol Mapper {
    func decode<T: Decodable>(data: Data) throws -> T
}
