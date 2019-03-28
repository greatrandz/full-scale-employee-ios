//
//  DashboardCardCollectionViewCell.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 20/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

final class DashboardCardCollectionViewCell: UICollectionViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addBorder( color: UIColor.lightGray.withAlphaComponent(0.5))
    }
    

}
