//
//  UIView+Extension.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 14/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit
import SnapKit

extension UIView {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func addBorder(width: CGFloat = .pixel,
                   color: UIColor = UIColor(red:0.20, green:0.23, blue:0.30, alpha:1.0)) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    func addSeparator(height: CGFloat = .pixel,
                      color: UIColor = UIColor(red:0.20, green:0.23, blue:0.30, alpha:1.0)) {
        addTopSeparator(height: height, color: color)
        addBottomSeparator(height: height, color: color)
    }
    
    func addTopSeparator(height: CGFloat = .pixel,
                         color: UIColor = UIColor(red:0.20, green:0.23, blue:0.30, alpha:1.0)) {
        let line = UIView()
        line.backgroundColor = color
        addSubview(line)
        line.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(height)
        }
    }
    
    func addBottomSeparator(height: CGFloat = .pixel,
                            color: UIColor = UIColor(red:0.20, green:0.23, blue:0.30, alpha:1.0)) {
        let line = UIView()
        line.backgroundColor = color
        addSubview(line)
        line.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(height)
        }
    }
}

extension CGFloat {
    static let pixel = 1 / UIScreen.main.scale
}
