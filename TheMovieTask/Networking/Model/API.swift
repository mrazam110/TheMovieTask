//
//  API.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 03/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import Foundation

public struct API {
    let baseURL: BaseURL
    var path: [String]
    
    public init(baseURL: BaseURL, path: [String] = []) {
        self.baseURL = baseURL
        self.path = path
    }
    
    public var url: URL {
        var components = URLComponents()
        components.scheme = self.baseURL.scheme
        components.host = self.baseURL.host
        components.port = self.baseURL.port
        components.path = "/" + self.path.joined(separator: "/")
        
        return components.url!
    }
}
