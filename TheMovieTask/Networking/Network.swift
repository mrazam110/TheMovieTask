//
//  Network.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 03/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import Foundation
import Alamofire

class Network: NSObject {
    
    static let shared = Network()
    
    func request<E: EndpointProvider>(request: E,
                                      completion: @escaping ((Result<E.Response, NetworkError>) -> Void)) {
        
        URLSessionConfiguration.default.timeoutIntervalForResource = request.endpoint.timeout
        
        Alamofire.request(request.endpoint.api.url,
                          method: request.endpoint.method,
                          parameters: request.endpoint.params,
                          encoding: request.endpoint.encoding,
                          headers: request.endpoint.headers)
            .response { (response) in
                if let error = response.error {
                    completion(.failure(NetworkError.server(error)))
                } else if let data = response.data {
                    do {
                        let dto: E.Response = try request.endpoint.mapper.decode(data: data)
                        completion(.success(dto))
                    } catch {
                        completion(.failure(.decoding(data, error)))
                    }
                }
        }
    }
}
