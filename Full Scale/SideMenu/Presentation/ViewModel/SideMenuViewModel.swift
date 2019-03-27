//
//  SideMenuViewModel.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 15/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

final class SideMenuViewModel: TableViewSection, SideMenuItemDelegate {
    private let coordinator: SideMenuCoordinator
    private let tableViewManager = TableViewManager()
    var items = [TableViewItem]()
    
    private var selectedIndexPath: IndexPath?
    private var mockItems: [[String: Any]] = [
        ["title": "Dashboard", "isDropdown": false],
        ["title": "Employees", "isDropdown": true],
        ["title": "Resources Allocation", "isDropdown": true],
        ["title": "Client Management", "isDropdown": true],
        ["title": "Applicants", "isDropdown": true],
        ["title": "Reporting", "isDropdown": true],
        ["title": "Settings", "isDropdown": true],
        ["title": "Logout", "isDropdown": false]
    ]
    
    var sections: [TableViewSection] {
        return [self]
    }
    
    init(coordinator: SideMenuCoordinator) {
        self.coordinator = coordinator
        configureItems()
    }
    
    func configureItems() {
        for (id, menu) in mockItems.enumerated() {
            let title = menu["title"] as! String
            let isDropdown = menu["isDropdown"] as! Bool
            let applications = SideMenuItem(id: id, title: title, isDropdown: isDropdown, hasSubitem: false, isSelected: false)
            applications.delegate = self
            items.append(applications)
        }
    }
    
    func configure(tableView: UITableView) {
        registerCells(for: tableView)
        tableViewManager.configure(tableView: tableView)
        tableViewManager.update(sections: self.sections)
    }
    
    func reload() {
        selectedIndexPath = nil
        items.removeAll()
        configureItems()
        tableViewManager.reloadData()
    }
    
    func registerCells(for tableView: UITableView) {
        tableView.register(SideMenuTableViewCell.nib,
                           forCellReuseIdentifier: SideMenuTableViewCell.identifier)
    }

    func didSelect(item: SideMenuItem, completion: ((Bool) -> Void)?) {
        
        if item.isDropdown {
            
            let sideMenuItems = items.filter { (rowItem) -> Bool in
                let rowItem = rowItem as! SideMenuItem
                return rowItem.hasSubitem
            }
            
            let shouldAnimate = tableViewManager.getIndexPath(id: item.id) == selectedIndexPath
            
            tableViewManager.removeItems(items: sideMenuItems, animated: shouldAnimate) {
                
                let indexPath = self.tableViewManager.getIndexPath(id: item.id)
                let isShowing = indexPath != self.selectedIndexPath || self.selectedIndexPath == nil
                self.selectedIndexPath = nil
                
                if isShowing {
                    self.showDropdown(title: item.title, at: indexPath)
                }
                completion?(isShowing)
            }
            
        }
        else {
            coordinator.testPushViewController()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.reload()
            }
        }
        
    }
    
    private func showDropdown(title: String, at indexPath: IndexPath) {
        
        let titleItem = title.contains("ees") ? "Employee List" : title
        let applicants = SideMenuItem(id: 100, title: titleItem,
                                      isDropdown: false, hasSubitem: true, isSelected: true)
        applicants.delegate = self
        let publicApplicant = SideMenuItem(id: 101, title: "Public Applicant Form",
                                           isDropdown: false, hasSubitem: true, isSelected: true)
        publicApplicant.delegate = self
        
        self.tableViewManager.insertItems(items: [applicants, publicApplicant], at: indexPath) {
            self.selectedIndexPath = indexPath
        }
    }
    
    var height: CGFloat {
        return 0
    }
    
    func headerView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    
}
