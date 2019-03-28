//
//  SideMenuTableViewCell.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 15/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

protocol SideMenuTableViewCellDelegate {
    func setSelected(_ selected: Bool, cell: SideMenuTableViewCell)
}

final class SideMenuTableViewCell: UITableViewCell {

    @IBOutlet private var downArrowImageView: UIImageView!
    @IBOutlet private var iconImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    var defaultColor: UIColor!
    var delegate: SideMenuTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        defaultColor = titleLabel.textColor
        let arrowImage = downArrowImageView.image
        let iconImage = iconImageView.image
        downArrowImageView.image = arrowImage?.withRenderingMode(.alwaysTemplate)
        iconImageView.image = iconImage?.withRenderingMode(.alwaysTemplate)
        addBottomSeparator(height: 0.6, color: UIColor.black.withAlphaComponent(0.6))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        downArrowImageView.orientationDown()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        delegate?.setSelected(selected, cell: self)
    }
    
    var isIconHidden: Bool! {
        get { return !iconImageView.isHidden }
        set {
            iconImageView.isHidden = !newValue
        }
    }
    
    var isDropdown: Bool! {
        get { return !downArrowImageView.isHidden }
        set {
            downArrowImageView.isHidden = !newValue
        }
    }
    
    var isActive: Bool! {
        get { return (titleLabel.textColor == .white) }
        set {
            let color = newValue ? .white : defaultColor
            titleLabel.textColor = color
            downArrowImageView.tintColor = color
            iconImageView.tintColor = color
            
            if newValue {
                downArrowImageView.orientationTop()
            }
            else {
                downArrowImageView.orientationDown()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if !isActive { isActive = true }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if isActive { isActive = false }
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        if isActive { isActive = false }
    }
    
}
