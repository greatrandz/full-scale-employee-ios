//
//  DashboardCardItem.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 20/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

final class DashboardCardItem: CollectionViewItem {
    
    let title: String
    let subtitle: String
    
    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }
    
    func cell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DashboardCardCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        
        cell.titleLabel.text = title
        cell.subtitleLabel.text = subtitle
        return cell
    }
    
    func size(_ collectionView: UICollectionView, at indexPath: IndexPath) -> CGSize {
        return tileSize(for: collectionView, height: 250)
    }
    
    func didSelectItem(_ collectionView: UICollectionView, cell: UICollectionViewCell, at indexPath: IndexPath) {
        
    }
    
    
}
