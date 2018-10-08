//
//  MemberDetailViewController.swift
//  mcpttapp
//
//  Created by Sunil Kumar Yadav on 01/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit
import MessageUI

class MemberDetailViewController: UIViewController {
    @IBOutlet weak var profileContainerView: UIView!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var actionItemContainer: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addContactButton: UIButton!
    @IBOutlet weak var createChannelButton: UIButton!
    @IBOutlet weak var addContactButtonWidth: NSLayoutConstraint!
    //Need to change it as Model once API Integeration
    var channelMemberListModel: ChannelMemberListCellViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Init the static view
        initView()
    }
    
    func initView() {
        self.title = "Memeber Profile"
        profileContainerView.layer.borderWidth = 1.0
        profileContainerView.layer.borderColor = UIColor.lightGray.cgColor
       
        emailContainerView.layer.borderWidth = 1.0
        emailContainerView.layer.borderColor = UIColor.lightGray.cgColor
        
        actionItemContainer.layer.borderWidth = 1.0
        actionItemContainer.layer.borderColor = UIColor.lightGray.cgColor
        
        //Need to put logic for show Add Contact Once DB Integeration
        addContactButtonWidth.constant = UIScreen.main.bounds.width/2
        
        nameLabel.text = channelMemberListModel?.memberName
        emailLabel.text = channelMemberListModel?.memberEmail
    }
    
    @IBAction func addContact(_ sender: Any) {
    }
    
    @IBAction func craeteChannel(_ sender: Any) {
        
    }
    
    @IBAction func emailAction(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            if let email = emailLabel.text {
                mail.setToRecipients([email])
            }
            mail.setMessageBody("<p>Welcome to MCPTT!</p>", isHTML: true)
            present(mail, animated: true)
        }
    }
}
extension MemberDetailViewController: MFMailComposeViewControllerDelegate {
    
   func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    controller.dismiss(animated: true)
   }
}
