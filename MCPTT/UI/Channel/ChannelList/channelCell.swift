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
    
    var channelStatus : String?
    var channelID: String?

    override func setupViews() {
        super.setupViews()
    }

    var channel: Channel? {
        didSet {
            channelName.text = channel?.channelName
            channelStatus = channel?.channelStatus
            channelID = channel?.channelID
            setupThumbnailImage()
            setupChannelIconImage()
            setupBroadcastImage()
            setupPttIconImage()
            setupMissedCallMessageCount()
            setupChannelStatusDescription()
        }
    }

    private func setupChannelIconImage() {
        if let channelIconImage = channel?.channelIconImageName {
            self.channelIconImage.image = UIImage(imageLiteralResourceName: channelIconImage)
        }
    }

    private func setupThumbnailImage() {
        if let channelThumbnailImageName = channel?.channelThumbnailImageName {
            self.channelStatusIcon.image = UIImage(imageLiteralResourceName: channelThumbnailImageName)
        }
    }

    private func setupBroadcastImage() {
        if let channelBroadcastImageName = channel?.broadcastMessageImageName {
            self.broadcastIconImage.image = UIImage(imageLiteralResourceName: channelBroadcastImageName)
        }
    }

    private func setupPttIconImage() {
        if let channelPttIconImageName = channel?.pttCallIconImageName {
            self.statusDescriptionIconImage.image = UIImage(imageLiteralResourceName: channelPttIconImageName)
        }
    }

    private func setupMissedCallMessageCount() {
        if let missedCount = channel?.missedPTTCount {
            self.countStatusLabel.text = missedCount
        }
    }

    private func setupChannelStatusDescription() {
        if let statusDescription = channel?.channelStatusDescription {
            self.statusDescriptionLabel.text = statusDescription
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
