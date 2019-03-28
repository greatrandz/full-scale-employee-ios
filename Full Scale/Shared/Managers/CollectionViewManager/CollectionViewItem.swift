//
//  CollectionViewItem.swift
//  TestRealm
//
//  Created by Randolf Dini-ay on 07/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

protocol CollectionViewItem {
    func cell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell
    
    func size( _ collectionView: UICollectionView, at indexPath: IndexPath) -> CGSize
    
    func didSelectItem(_ collectionView: UICollectionView, cell: UICollectionViewCell, at indexPath: IndexPath)
}

extension CollectionViewItem {
    func tileSize(for collectionView: UICollectionView, height: CGFloat = 150) -> CGSize {
        let width = collectionView.frame.width
        
        if width <= Device.compactWidth {
            return CGSize(width: width, height: height)
        }
        
        if width <= Device.iPadPro12InchMultitaskingLargeWidth {
            return CGSize(width: floor(width / 2), height: height)
        }
        
        return CGSize(width: floor(width / 2)-10, height: height)
    }
}
