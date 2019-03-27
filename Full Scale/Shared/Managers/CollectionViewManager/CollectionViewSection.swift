//
//  CollectionViewSection.swift
//  TestRealm
//
//  Created by Randolf Dini-ay on 07/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit
protocol CollectionViewSection {
    var items: [CollectionViewItem] { get }
    
    var height: CGFloat { get }
    
    var minimumLineSpacing: CGFloat { get }
    
    var minimumInteritemSpacing: CGFloat { get }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    
    func headerView(_ collectionView: UICollectionView,
                       viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView?
}

extension CollectionViewSection {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
      return UIEdgeInsets()
    }
    
    var minimumLineSpacing: CGFloat {
        return 0
    }
    var minimumInteritemSpacing: CGFloat {
        return 0
    }
    
}
