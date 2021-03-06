//
//  RequestProvider.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 03/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import Foundation

public protocol EndpointProvider {
    associatedtype Response: DTO
    
    var endpoint: Endpoint { get }
}
