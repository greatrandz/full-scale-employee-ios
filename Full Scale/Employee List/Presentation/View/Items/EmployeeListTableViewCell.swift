//
//  EmployeeListTableViewCell.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 21/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

final class EmployeeListTableViewCell: UITableViewCell {

    @IBOutlet private var photoImageView: UIImageView!
    @IBOutlet private var stackView: UIStackView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var positionLabel: UILabel!
    @IBOutlet var departmentLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    private var didAwakeFromNib = false
    
    private var isHorizontal: Bool {
        return Device.isHorizontal
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        isStackViewHorizontal = isHorizontal
        addBorder( color: UIColor.lightGray.withAlphaComponent(0.5))
        
        let radius = photoImageView.frame.width / 2
        photoImageView.layer.masksToBounds = false
        photoImageView.layer.borderColor = UIColor.white.cgColor
        photoImageView.layer.cornerRadius = radius
        photoImageView.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    var isStackViewHorizontal: Bool {
        get { return (stackView.axis == .horizontal) }
        set {
            let isHorizontal = newValue
            let axis:NSLayoutConstraint.Axis = isHorizontal ? .horizontal : .vertical
            stackView.axis = axis
            stackView.subviews[3].isHidden = !isHorizontal
            stackView.distribution = isHorizontal ? .fillProportionally : .fill
            configureStackView()
        }
    }
    
    private func configureStackView() {
        stackView.snp.removeConstraints()
        nameLabel.snp.removeConstraints()
        positionLabel.snp.removeConstraints()
        departmentLabel.snp.removeConstraints()
        statusLabel.snp.removeConstraints()
        for constraint in stackView.constraints {
            //print("testConstraint: \(constraint)")
            if "\(constraint)".contains("*") {
                stackView.removeConstraint(constraint)
            }
        }
        
        let height = isStackViewHorizontal ? 80 : 20
        let space = isStackViewHorizontal ? 0 : 15
        stackView.snp.remakeConstraints {
            $0.height.greaterThanOrEqualTo(height)
            $0.top.bottom.equalToSuperview().inset(space)
        }
        
        nameLabel.snp.remakeConstraints {
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.top.bottom.equalToSuperview()
        }
        positionLabel.snp.remakeConstraints {
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.top.bottom.equalToSuperview()
        }
        departmentLabel.snp.remakeConstraints {
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.top.bottom.equalToSuperview()
        }
        statusLabel.snp.remakeConstraints {
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.top.bottom.equalToSuperview()
        }
        
        if isStackViewHorizontal {
            nameLabel.superview!.snp.remakeConstraints {
                $0.width.equalTo(stackView).multipliedBy(0.40)
            }
            positionLabel.superview!.snp.remakeConstraints {
                $0.width.equalTo(stackView).multipliedBy(0.25)
            }
            departmentLabel.superview!.snp.remakeConstraints {
                $0.width.equalTo(stackView).multipliedBy(0.20)
            }
            statusLabel.superview!.snp.remakeConstraints {
                $0.width.equalTo(stackView).multipliedBy(0.15)
            }
        }
        
        let color =  isStackViewHorizontal ? UIColor.lightGray.withAlphaComponent(0.5) : .clear
        nameLabel.superview?.addBorder(color: color)
        positionLabel.superview?.addBorder(color: color)
        departmentLabel.superview?.addBorder(color: color)
        statusLabel.superview?.addBorder(color: color)
        
    }
    
    
}
