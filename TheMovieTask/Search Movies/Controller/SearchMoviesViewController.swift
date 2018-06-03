//
//  SearchMoviesViewController.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 03/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import UIKit

class SearchMoviesViewController: UIViewController {
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet fileprivate weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet fileprivate weak var errorLabel: UILabel!
    
    var viewModel: SearchMoviesViewModel!
    var searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.delegate = self
        
        rebaseTableview()
        
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = false
            navigationItem.searchController = searchController
        } else {
            // Fallback on earlier versions
            tableView.tableHeaderView = searchController.searchBar
        }
    }
    
    private func rebaseTableview() {
        let sourceAndDelegate: UITableViewDelegate & UITableViewDataSource = searchController.isActive ? viewModel.history : viewModel.movies
        tableView.dataSource = sourceAndDelegate
        tableView.delegate = sourceAndDelegate
    }
    
    private func reloadTableView(animated: Bool) {
        rebaseTableview()
        if animated {
            let indexSet = IndexSet.init(integer: 0)
            tableView.reloadSections(indexSet, with: UITableViewRowAnimation.fade)
        } else { tableView.reloadData() }
    }
    
    public class func fromStoryboard() -> SearchMoviesViewController {
        return UIStoryboard.main.instantiateViewController(withIdentifier: "movie_search_view_controller") as! SearchMoviesViewController
    }
}

// MARK: - Movies Search Delegate
extension SearchMoviesViewController: SearchMoviesDelegate {
    func dataSourceDidUpdated() {
        DispatchQueue.main.async { self.reloadTableView(animated: true) }
    }
    
    func fetchingDataFromServer(isFetching: Bool) {
        DispatchQueue.main.async {
            self.errorLabel.text = nil
            isFetching ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
        }
    }
    
    func errorDidOccurred(error: Error) {
        DispatchQueue.main.async { self.errorLabel.text = error.localizedDescription }
    }
    
    func didScrollToBottom() {
        if !activityIndicator.isAnimating {
            viewModel.fetchNextPage()
        }
    }
}

// MARK: - UITableView Delegate and Datasource

extension SearchMoviesViewController: SearchHistoryDelegate {
    func selected(query: String) {
        viewModel.searchMoviesFromServer(searchText: query)
        searchController.isActive = false
    }
}


// MARK: - UISearchResultsUpdating
extension SearchMoviesViewController: UISearchBarDelegate, UISearchControllerDelegate {
    
    func didPresentSearchController(_ searchController: UISearchController) {
        reloadTableView(animated: true)
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        reloadTableView(animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        selected(query: searchBar.text!)
    }
}
