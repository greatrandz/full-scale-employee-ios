//
//  SideMenuItem.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 15/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

protocol SideMenuItemDelegate {
    func didSelect(item: SideMenuItem, completion: ((_ : Bool) -> Void)?)
}

final class SideMenuItem: TableViewItem, SideMenuTableViewCellDelegate {

    let id: Int
    let sideMenu: SideMenu
    let isDropdown: Bool
    let hasSubitem: Bool
    var isSelected: Bool
    var delegate: SideMenuItemDelegate?

    var height: CGFloat {
        return UITableView.automaticDimension
    }
    
    init(id: Int, sideMenu: SideMenu, isDropdown: Bool, hasSubitem: Bool, isSelected: Bool) {
        self.id = id
        self.sideMenu = sideMenu
        self.isDropdown = isDropdown
        self.hasSubitem = hasSubitem
        self.isSelected = isSelected
    }
    
    func cell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: SideMenuTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        cell.delegate = self
        cell.titleLabel.text = sideMenu.title
        configureHighlightedCell(cell, color: UIColor(hex: "#212529").withAlphaComponent(0.8))
        DispatchQueue.main.async {
            cell.isSelected = self.isSelected
        }
        //print("==========================================title: \(title) | selected: \(isSelected)")
        return cell
    }
    
    func cell(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell: SideMenuTableViewCell = tableView.cellForRow(at: indexPath)
        
        delegate?.didSelect(item: self) { (selected) -> Void in
            DispatchQueue.main.async {
                cell.isSelected = selected
            }
        }
    }
    
    func setSelected(_ selected: Bool, cell: SideMenuTableViewCell) {

        if isDropdown {
            isSelected = selected
            cell.isIconHidden = !hasSubitem
        }
        //print("title: \(title) | selected: \(selected)")
        let isActive = (isDropdown && isSelected)
        cell.isActive = isActive
        cell.isDropdown = isDropdown
    }
    
    private func configureHighlightedCell(_ cell: SideMenuTableViewCell, color: UIColor) {
        
        let leftBorder = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: cell.bounds.height + 1))
        leftBorder.addBorder(width: leftBorder.frame.width, color: UIColor(hex: "#028740"))
        let bgColorView = UIView()
        bgColorView.addSubview(leftBorder)
        bgColorView.backgroundColor = color
        cell.selectedBackgroundView = bgColorView
        
    }
    
}
