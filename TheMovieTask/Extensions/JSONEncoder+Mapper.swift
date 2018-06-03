//
//  JSONEncoder+Mappable.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 03/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import Foundation

extension JSONDecoder: Mapper {
    public func decode<T: Decodable>(data: Data) throws -> T {
        return try decode(T.self, from: data)
    }
}
