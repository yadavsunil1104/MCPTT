//
//  MenuCell.swift
//  mcpttapp
//
//  Created by Toor, Sanju on 03/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class  MenuCell: BaseCell, UICollectionViewDelegateFlowLayout {
    
    //@IBOutlet weak var menuBarLabel: UILabel!
    
    let menuBarLabel: UILabel = {
        let mbLabel = UILabel()
        mbLabel.textColor = UIColor.gray
        mbLabel.textAlignment = .center
        return mbLabel
    }()
    
    override var isHighlighted: Bool {
        didSet {
            menuBarLabel.textColor = isHighlighted ? UIColor.rgb(red: 0, green: 176, blue: 240) : UIColor.gray  // 0,176,240/#00b0f0 - lightBlue as per UX color
        }
    }
    
    override var isSelected: Bool {
        didSet {
            menuBarLabel.textColor = isSelected ? UIColor.rgb(red: 0, green: 176, blue: 240)  : UIColor.gray  // 0,176,240/#00b0f0 - lightBlue as per UX color
        }
    }
    
    override func setupViews() {
        super.setupViews()
        menuBarLabel.textColor = UIColor.blue
        
        addSubview(menuBarLabel)
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: menuBarLabel)
        addConstraintsWithFormat(format: "V:|[v0(35)]|", views: menuBarLabel)
        
        addConstraint(NSLayoutConstraint(item: menuBarLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: menuBarLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        menuBarLabel.backgroundColor = UIColor.blue
    }
}
