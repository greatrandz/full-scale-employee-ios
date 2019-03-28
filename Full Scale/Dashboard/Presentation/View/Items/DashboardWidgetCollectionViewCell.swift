//
//  DashboardWidgetTableViewCell.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 16/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

final class DashboardWidgetCollectionViewCell: UICollectionViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var logoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addBorder( color: UIColor.lightGray.withAlphaComponent(0.5))
    }
    
}
