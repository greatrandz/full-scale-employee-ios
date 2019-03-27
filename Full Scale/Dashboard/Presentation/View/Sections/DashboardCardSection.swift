//
//  DashboardCardSection.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 20/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

final class DashboardCardSection: CollectionViewSection {
    
    
    private(set) var items = [CollectionViewItem]()
    
    init() {
        let Employees = DashboardCardItem(title: "Annoucement", subtitle: "Juliet Mendez added new employee Joshua Barbon Sacramento.\nJuliet Mendez added new employee Joshua Earl Flores Sultan.\nJuliet Mendez added new employee Ralph Jay Pepito.")
        items.append(Employees)
        let Applicants = DashboardCardItem(title: "Activity Stream", subtitle: "Juliet Mendez added new employee Joshua Barbon Sacramento.")
        items.append(Applicants)
        let Clients = DashboardCardItem(title: "March's Birthday", subtitle: "No Post Yet")
        items.append(Clients)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    var height: CGFloat {
        return 0
    }
    
    func headerView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView? {
        return nil
    }
    
    
}
