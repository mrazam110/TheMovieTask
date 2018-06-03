//
//  SearchMoviesRequest.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 04/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import Foundation

struct SearchMoviesRequest {
    let query: String
    let page: Int
    
    init(searchText text: String,
         forPage page: Int = 1) {
        
        self.query = text
        self.page = page
    }
}

extension SearchMoviesRequest: EndpointProvider {
    var endpoint: Endpoint {
        return Endpoint(api: .searchMovie, params: ["api_key": "2696829a81b1b5827d515ff121700838", "page": "\(page)", "query": query])
    }
    
    typealias Response = SearchMoviesResponse
}
