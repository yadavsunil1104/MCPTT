//
//  ChannelCell.swift
//  mcpttapp
//
//  Created by Toor, Sanju on 03/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

class ChannelCell: BaseCell {
    
    @IBOutlet weak var broadcastIconImage: UIImageView!
    @IBOutlet weak var channelIconImage: UIImageView!
    @IBOutlet weak var channelName: UILabel!
    @IBOutlet weak var channelStatusIcon: UIImageView!
    @IBOutlet weak var countStatusLabel: UILabel!
    @IBOutlet weak var statusDescriptionIconImage: UIImageView!
    @IBOutlet weak var statusDescriptionLabel: UILabel!
    @IBOutlet weak var separatorView: UILabel!
    
    @IBOutlet weak var statusLabelLeadingConstraints: NSLayoutConstraint!
    
    override func setupViews() {
        super.setupViews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
