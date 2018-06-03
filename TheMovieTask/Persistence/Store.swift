//
//  Store.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 03/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import Foundation

enum Store {
    case history
    
    private var fileURL: URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent("history.archive")
    }
    
    func get<T: Comparable> () -> [T]? {
        switch self {
        case .history:
            guard let path = fileURL,
                let data = try? Data(contentsOf: path),
                let array = NSKeyedUnarchiver.unarchiveObject(with: data) as? Array<T> else { return nil }
            return array.sorted()
        }
    }
    
    func set<T: Hashable> (value: T) throws {
        switch self {
        case .history:
            guard let path = fileURL else { return }
            var data = try? Data(contentsOf: path)
            
            if let _data = data {
                var array = NSKeyedUnarchiver.unarchiveObject(with: _data) as! Array<T>
                array.append(value)
                data = NSKeyedArchiver.archivedData(withRootObject: Array(Set(array)))
            } else {
                data = NSKeyedArchiver.archivedData(withRootObject: [value])
            }
            
            try data?.write(to: path)
        }
    }
}
