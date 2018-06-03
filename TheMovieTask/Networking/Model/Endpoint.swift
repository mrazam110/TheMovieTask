//
//  Request.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 03/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import Foundation
import Alamofire

public struct Endpoint {

    let api: API
    let method: HTTPMethod
    let params: Parameters?
    let headers: HTTPHeaders?
    let encoding: ParameterEncoding
    let timeout: TimeInterval
    let mapper: Mapper
    
    public init(api: API,
                method: HTTPMethod = .get,
                params: Parameters? = nil,
                headers: HTTPHeaders? = nil,
                encoding: ParameterEncoding = URLEncoding.default,
                timeout: TimeInterval = 30,
                mapper: Mapper = JSONDecoder()) {
        
        self.api = api
        self.method = method
        self.params = params
        self.headers = headers
        self.encoding = encoding
        self.timeout = timeout
        self.mapper = mapper
    }
    
}
