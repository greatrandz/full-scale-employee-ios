//
//  EmployeeListViewModel.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 21/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

final class EmployeeListViewModel: TableViewSection {
    
    private let coordinator: EmployeeListCoordinator
    private var tableViewManager = TableViewManager()
    var items = [TableViewItem]()
    
    private var isHorizontal: Bool {
        return Device.isHorizontal
    }
    
    var sections: [TableViewSection] {
        return [self]
    }
    
    init(coordinator: EmployeeListCoordinator) {
        self.coordinator = coordinator
        configureItems()
    }
    
    func configure(tableView: UITableView) {
        registerCells(for: tableView)
        tableViewManager.configure(tableView: tableView)
        tableViewManager.update(sections: sections)
    }
    
    func registerCells(for tableView: UITableView) {
        tableView.register(EmployeeListTableViewCell.nib, forCellReuseIdentifier: EmployeeListTableViewCell.identifier)
    }
    
    func configureItems() {
        var item = EmployeeListItem(id: 1, name: "Dini-ay, Randolf Omalsa", position: "iOS Engineer", department: "Unassigned", status: "Available")
        items.append(item)
        item = EmployeeListItem(id: 2, name: "Patiga, Alma Abella", position: "Project Manager", department: "Unassigned", status: "Available")
        items.append(item)
        item = EmployeeListItem(id: 3, name: "Dini-ay, Rainer Jay Omalsa", position: "PHP Developer", department: "Unassigned", status: "Available")
        items.append(item)
        
        item = EmployeeListItem(id: 4, name: "Dini-ay, Rhea Omalsa", position: "Software Engineer", department: "Unassigned", status: "Available")
        items.append(item)
        item = EmployeeListItem(id: 5, name: "Dini-ay, Rain Patiga", position: "Architect Engineer", department: "Unassigned", status: "Available")
        items.append(item)
        
        if isHorizontal {
            let headerItem = EmployeeListItem(id: 0, name: "Name", position: "Position", department: "Department", status: "Status")
            items.insert(headerItem, at: 0)
        }
    }
    
    var height: CGFloat {
        return isHorizontal ? 12 : 0
    }
    
    func headerView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
}
