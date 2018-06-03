//
//  History.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 03/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import UIKit

final class History: NSObject, UITableViewDataSource {
    
    private var history: [String] {
        if let history = Store.history.get() as [String]? {
            return history
        } else { return [] }
    }
    
    private weak var delegate: SearchHistoryDelegate?
    
    init(delegate: SearchHistoryDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "history_cell")!
        
        cell.textLabel?.text = history[indexPath.row]
        
        return cell
    }
}

extension History: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let query = history[indexPath.row]
        delegate?.selected(query: query)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
