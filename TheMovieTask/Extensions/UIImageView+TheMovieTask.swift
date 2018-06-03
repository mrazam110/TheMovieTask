//
//  UIImageView+TheMovieTask.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 03/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    public func setImage(with resource: String?, api: API, showIndicator: Bool = false, animated: Bool = true) {
        guard let resource = resource else { return }
        
        var resourceAPI = api
        resourceAPI.path.append(resource)
        
        self.setImage(with: resourceAPI.url, showIndicator: showIndicator, animated: animated)
    }
    
    public func setImage(with resource: URL?, showIndicator: Bool = false, animated: Bool = true) {
        guard let resource = resource else { return }
        
        self.kf.indicatorType = showIndicator ? .activity : .none
        self.kf.setImage(with: resource, options: [.transition(.fade(0.15))])
    }
}
