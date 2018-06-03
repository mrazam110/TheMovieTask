//
//  SearchMoviesDelegate.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 03/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import Foundation

protocol SearchMoviesDelegate: class {
    func dataSourceDidUpdated()
    func fetchingDataFromServer(isFetching: Bool)
    func errorDidOccurred(error: Error)
    func didScrollToBottom()
}

protocol SearchHistoryDelegate: class {
    func selected(query: String)
}
