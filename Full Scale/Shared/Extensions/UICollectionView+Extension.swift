//
//  UICollectionView+Extension.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 20/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func dequeueReusableCell<T: UICollectionViewCell>(reuseIdentifier: String = T.identifier, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError("Failed to dequeue cell of type \(T.self).")
        }
        return cell
    }
    
    func cellForItem<T: UICollectionViewCell>(at indexPath: IndexPath) -> T {
        guard let cell = cellForItem(at: indexPath) as? T else {
            fatalError("Failed to dequeue cell of type \(T.self).")
        }
        return cell
    }
    
}
