//
//  EmployeeListItem.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 21/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

final class EmployeeListItem: TableViewItem {
    
    let id: Int
    private let name: String
    private let position: String
    private let department: String
    private let status: String
    
    init(id: Int, name: String, position: String, department: String, status: String) {
        self.id = id
        self.name = name
        self.position = position
        self.department = department
        self.status = status
    }
    
    private var isHorizontal: Bool {
        return Device.isHorizontal
    }
    
    var height: CGFloat {
        let headerHeight:CGFloat = isHorizontal ? 50 : 0
        return (id == 0) ? headerHeight : UITableView.automaticDimension
    }
    
    func cell(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func cell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EmployeeListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        cell.nameLabel.text = name
        cell.positionLabel.text = position
        cell.departmentLabel.text = department
        cell.statusLabel.text = status

        cell.backgroundColor = (indexPath.row % 2 == 1 && isHorizontal)
            ? UIColor(hex: "#F5F6FA") : .white
        cell.contentView.isHidden = (!isHorizontal && (id == 0))
        cell.accessoryType = .disclosureIndicator
        //dee2e6
        return cell
    }
}
