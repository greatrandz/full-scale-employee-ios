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
    private let logoutService = LogoutService()
    
    private var selectedIndexPath: IndexPath?
    private var mockItems: [[String: Any]] = [
        ["sideMenu": SideMenu.dashboard, "isDropdown": false],
        ["sideMenu": SideMenu.employees, "isDropdown": true],
        ["sideMenu": SideMenu.resourcesAllocation, "isDropdown": true],
        /*["title": "Client Management", "isDropdown": true],
        ["title": "Applicants", "isDropdown": true],
        ["title": "Reporting", "isDropdown": true],
        ["title": "Settings", "isDropdown": true],*/
        ["sideMenu": SideMenu.logout, "isDropdown": false]
    ]
    
    var items = [TableViewItem]()
    var sections: [TableViewSection] {
        return [self]
    }
    
    init(coordinator: SideMenuCoordinator) {
        self.coordinator = coordinator
        configureItems()
    }
    
    func configureItems() {
        for (id, item) in mockItems.enumerated() {
            let sideMenu = item["sideMenu"] as! SideMenu
            let isDropdown = item["isDropdown"] as! Bool
            let applications = SideMenuItem(id: id, sideMenu: sideMenu, isDropdown: isDropdown, hasSubitem: false, isSelected: false)
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.selectedIndexPath = nil
            self.items.removeAll()
            self.configureItems()
            self.tableViewManager.reloadData()
        }
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
                    self.showDropdown(sideMenu: item.sideMenu, at: indexPath)
                }
                completion?(isShowing)
            }
            
        }
        else {
            switch item.sideMenu {
                
            case .dashboard:
                coordinator.sideToggle()
                
            case .employeeList:
                coordinator.testPushViewController()
                reload()
                
            case .manageResources:
                coordinator.sideToggle()
                
            case .logout:
                logoutService.logout()
                coordinator.presentLogin()
                
            default:
                break
            }
            
        }
        
    }
    
    private func showDropdown(sideMenu: SideMenu, at indexPath: IndexPath) {
        var sideMenuItems = [SideMenuItem]()
        switch sideMenu {
            case .employees:
                let employeeList = SideMenuItem(id: 100, sideMenu: .employeeList,
                                              isDropdown: false, hasSubitem: true, isSelected: true)
                employeeList.delegate = self
                sideMenuItems.append(employeeList)
            
            case .resourcesAllocation:
                let manageResources = SideMenuItem(id: 100, sideMenu: .manageResources,
                                            isDropdown: false, hasSubitem: true, isSelected: true)
                manageResources.delegate = self
                sideMenuItems.append(manageResources)
            
            default:
                break
        }
        
        self.tableViewManager.insertItems(items: sideMenuItems, at: indexPath) {
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

enum SideMenu: String {
    case dashboard
    case employees
    case employeeList
    case resourcesAllocation
    case manageResources
    
    case logout
    
    var title: String {
        switch self {
        case .dashboard:
            return "Dashboard"
            
        case .employees: return "Employees"
        case .employeeList:  return "Employee List"
            
        case .resourcesAllocation: return "Resources Allocation"
        case .manageResources: return "Manage Resources"
            
        case .logout:
            return "Logout"
        }
    }
}
