//
//  DashboardWidgetItem.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 16/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

final class DashboardWidgetItem: CollectionViewItem {
    
    let title: String
    let count: Int
    let color: UIColor
    
    init(title: String, count: Int, color: UIColor) {
        self.title = title
        self.count = count
        self.color = color
    }
    
    func cell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DashboardWidgetCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        configureCell(cell)
        return cell
    }
    
    func size(_ collectionView: UICollectionView, at indexPath: IndexPath) -> CGSize {
        return tileSize(for: collectionView)
    }
    
    func didSelectItem(_ collectionView: UICollectionView, cell: UICollectionViewCell, at indexPath: IndexPath) {
        
    }
    
    private func configureCell(_ cell: DashboardWidgetCollectionViewCell) {
        let radius = cell.logoImageView.frame.width / 2
        cell.titleLabel.text = title
        cell.countLabel.text = "\(count)"
        cell.logoImageView.backgroundColor = color
        cell.logoImageView.layer.masksToBounds = false
        cell.logoImageView.layer.borderColor = UIColor.white.cgColor
        cell.logoImageView.layer.cornerRadius = radius
        cell.logoImageView.clipsToBounds = true
    }
    
}
