//
//  SearchMoviesTableViewCell.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 03/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import UIKit

class SearchMoviesTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var backdropImageView: UIImageView!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    
    func setData(movie: Movie) {
        self.titleLabel.text = movie.name
        self.overviewLabel.text = movie.overview
        self.posterImageView.setImage(with: movie.poster, api: .poster, showIndicator: true)
        self.backdropImageView.setImage(with: movie.backdrop, api: .poster)
    }
    
}
