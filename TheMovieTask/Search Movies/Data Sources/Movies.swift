//
//  Movies.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 03/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import UIKit

final class Movies: NSObject {
    
    private weak var delegate: SearchMoviesDelegate?
    
    private var searchMovieResponse: SearchMoviesResponse?
    private var searchMovieRequest: SearchMoviesRequest?
    
    private var movies: [Movie] = [] {
        didSet {
            self.delegate?.dataSourceDidUpdated()
        }
    }
    
    init(delegate: SearchMoviesDelegate) {
        self.delegate = delegate
    }
    
    func searchMoviesFromServer(searchText query: String) {
        movies = []
        searchMovieResponse = nil
        let request = SearchMoviesRequest(searchText: query)
        
        self.networkCall(with: request)
    }
    
    func fetchNextPage() {
        guard let searchMovieResponse = searchMovieResponse else { return }
        guard let lastMovieRequest = searchMovieRequest else { return }
        if searchMovieResponse.page < searchMovieResponse.totalPages {
            let request = SearchMoviesRequest(searchText: lastMovieRequest.query, forPage: searchMovieResponse.page + 1)
            
            self.networkCall(with: request)
        }
    }
    
    private func networkCall(with request: SearchMoviesRequest) {
        self.searchMovieRequest = request
        self.delegate?.fetchingDataFromServer(isFetching: true)
        
        Network.shared.request(request: request) { (result) in
            self.delegate?.fetchingDataFromServer(isFetching: false)
            switch result {
            case .success(let dto):
                try? Store.history.set(value: request.query)
                self.searchMovieResponse = dto
                self.movies.append(contentsOf: dto.movies)
            case .failure(let error):
                self.delegate?.errorDidOccurred(error: error)
            }
        }
    }
}

extension Movies: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movie_cell") as! SearchMoviesTableViewCell
        
        let movie = movies[indexPath.row]
        cell.setData(movie: movie)
        
        return cell
    }
}

extension Movies: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y + scrollView.frame.height >= scrollView.contentSize.height {
            delegate?.didScrollToBottom()
        }
    }
}
