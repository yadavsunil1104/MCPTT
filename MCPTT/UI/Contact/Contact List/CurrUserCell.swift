//
//  CurrUserCell.swift
//  MCPTTv2
//
//  Created by Raju Maramulla on 04/10/18.
//  Copyright © 2018 Raju Maramulla. All rights reserved.
//

import Foundation
import  UIKit

class CurrUserCell : UICollectionViewCell {
    
    @IBOutlet weak var currUserName: UILabel!
    @IBOutlet weak var currUserMCID: UILabel!
    
    override func awakeFromNib() {
        currUserName.text = ""
        currUserMCID.text = ""
    }
}
