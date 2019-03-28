//
//  DashboardWidgetSection.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 16/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

final class DashboardWidgetSection: CollectionViewSection {
    private(set) var items = [CollectionViewItem]()
    
    init() {
        
        let Employees = DashboardWidgetItem(title: "Employees", count: 151, color: UIColor(hex: "#6f42c1"))
        items.append(Employees)
        let Applicants = DashboardWidgetItem(title: "Applicants", count: 95, color: UIColor(hex: "#28a745"))
        items.append(Applicants)
        let Clients = DashboardWidgetItem(title: "Clients", count: 25, color: UIColor(hex: "#e83e8c"))
        items.append(Clients)
        let Projects = DashboardWidgetItem(title: "Projects", count: 34, color: UIColor(hex: "#fd7e14"))
        items.append(Projects)
    }
    
    var height: CGFloat {
        return 0
    }
    
    func headerView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView? {
        return nil
    }
    
    
}
