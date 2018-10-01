//
//  ChannelMemberListTableViewCell.swift
//  mcpttapp
//
//  Created by Sunil Kumar Yadav on 01/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

class ChannelMemberListTableViewCell: UITableViewCell {

    @IBOutlet weak var memberNameLabel: UILabel!
    @IBOutlet weak var memberEmailLabel: UILabel!
    @IBOutlet weak var memberAvailabiltyStatus: UIImageView!
    @IBOutlet weak var addMemberButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureChanneListCell(channelMemberListCellVM: ChannelMemberListCellViewModel) {
        
        memberNameLabel.text = channelMemberListCellVM.memberName
        memberEmailLabel.text = channelMemberListCellVM.memberEmail
        if channelMemberListCellVM.isMemeberInConatctList {
            addMemberButton.isHidden = true
        } else {
           addMemberButton.isHidden = false
        }
    }
    
    @IBAction func addContact(_ sender: Any) {
        
    }
    
}
