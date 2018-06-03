//
//  SearchMoviesViewModel.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 03/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import Foundation
import UIKit

class SearchMoviesViewModel: NSObject {
    
    let history: History
    let movies: Movies
    
    init(delegate: SearchMoviesDelegate & SearchHistoryDelegate) {
        history = History(delegate: delegate)
        movies = Movies(delegate: delegate)
    }
    
    func searchMoviesFromServer(searchText query: String) {
        movies.searchMoviesFromServer(searchText: query)
    }
    
    func fetchNextPage() {
        movies.fetchNextPage()
    }
}
