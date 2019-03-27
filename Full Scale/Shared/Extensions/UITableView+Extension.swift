//
//  UITableView+Extension.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 20/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(reuseIdentifier: String = T.identifier, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError("Failed to dequeue cell of type \(T.self).")
        }
        return cell
    }
    
    func cellForRow<T: UITableViewCell>(at indexPath: IndexPath) -> T {
        guard let cell = cellForRow(at: indexPath) as? T else {
            fatalError("Failed to dequeue cell of type \(T.self).")
        }
        return cell
    }
    
}
