//
//  ChatMessageCell.swift
//  mcpttapp
//
//  Created by Hemanth Kumar H N on 04/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation
import UIKit

class ChatMessageCell: UICollectionViewCell {
    @IBOutlet weak var messageSender: UILabel?
    @IBOutlet weak var messageDate: UILabel?
    @IBOutlet weak var messageTime: UILabel?
      @IBOutlet weak var commentImageView: UIImageView!
    @IBOutlet weak var messageDateHeightConst: NSLayoutConstraint!
    @IBOutlet weak var rightSideTimeWidthConst: NSLayoutConstraint!
     @IBOutlet weak var commentImageHeightConst: NSLayoutConstraint!
    
    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var LeftSideTimeWidthConst: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(senderName: String, senderDate: Date, messageKind: MessageKind) {
        messageSender?.text = senderName
        messageDate?.text = "dec 25 2018"
        messageTime?.text = "04:00"
    }
}
