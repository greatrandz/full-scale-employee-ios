//
//  DashboardViewModel.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 14/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

final class DashboardViewModel {
    
    let coordinator: DashboardCoordinator
    let collectionViewManager = CollectionViewManager()
    private(set) var sections = [CollectionViewSection]()
    
    init(coordinator: DashboardCoordinator) {
        self.coordinator = coordinator
        configureItems()
    }
    
    func configure(collectionView: UICollectionView, flowLayout: UICollectionViewFlowLayout) {
        registerCells(for: collectionView)
        collectionViewManager.configure(collectionView: collectionView, flowLayout: flowLayout)
        collectionViewManager.update(sections: sections)
    }
    
    func registerCells(for collectionView: UICollectionView) {
        collectionView.register(DashboardWidgetCollectionViewCell.nib, forCellWithReuseIdentifier: DashboardWidgetCollectionViewCell.identifier)
        collectionView.register(DashboardCardCollectionViewCell.nib, forCellWithReuseIdentifier: DashboardCardCollectionViewCell.identifier)
    }
    
    func configureItems() {
        
        let section = DashboardWidgetSection()
        sections.append(section)
        
        let section2 = DashboardCardSection()
        sections.append(section2)
    }
    
}
