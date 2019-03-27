//
//  CollectionViewManager.swift
//  TestRealm
//
//  Created by Randolf Dini-ay on 07/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

final class CollectionViewManager: NSObject {
    private weak var collectionView: UICollectionView?
    private weak var flowLayout: UICollectionViewFlowLayout?
    
    private(set) var sections = [CollectionViewSection]()
    
    func configure(collectionView: UICollectionView, flowLayout: UICollectionViewFlowLayout) {
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView = collectionView
        self.flowLayout = flowLayout
    }
    
    func update(sections: [CollectionViewSection]) {
        self.sections = sections
        reload()
    }
    
    func insert(section: CollectionViewSection, at: Int) {
        sections.append(section)
        var paths = [IndexPath]()
        for row in 0 ..< section.items.count {
            let indexPath = IndexPath(row: row + section.items.count, section: at)
            paths.append(indexPath)
        }
        collectionView?.insertItems(at: paths)
    }
    
    func reload() {
        collectionView?.reloadData()
    }
}

extension CollectionViewManager: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return sections[indexPath.section].items[indexPath.row].cell(collectionView, at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        sections[indexPath.section].items[indexPath.row].didSelectItem(collectionView, cell: cell, at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = sections[indexPath.section].headerView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
        else {
            fatalError("Unexpected element kind")
        }
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: sections[section].height)
    }
}

extension CollectionViewManager: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sections[section].collectionView(collectionView, layout: collectionViewLayout, insetForSectionAt: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sections[indexPath.section].items[indexPath.row].size(collectionView, at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sections[section].minimumLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sections[section].minimumInteritemSpacing
    }
    
}
