//
//  ConversationViewController.swift
//  mcpttapp
//
//  Created by Hemanth Kumar H N on 01/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation
import UIKit

class ConversationViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var pttToggleBtn: UIButton!
    
    @IBOutlet weak var messageText: UITextField!
    @IBOutlet weak var ChatCollectionView: UICollectionView!
    @IBOutlet weak var ChatCollectionViewHeightConst: NSLayoutConstraint!
    @IBOutlet weak var messageViewHightConst: NSLayoutConstraint!
    
    var isPTTEnabled: Bool = true
    let refreshControl = UIRefreshControl()
    var presenter: CVViewToCVPresenter?
    var tableView: UITableView?
    var messageList: [MesssageDetails] = []
    
    @IBAction func togglePTTAndKeyboard(_ sender: Any) {
        if isPTTEnabled {
            self.messageText.becomeFirstResponder()
            self.pttToggleBtn.setImage(UIImage(named: "keyboard"), for: .normal)
        } else {
            self.pttToggleBtn.setImage(UIImage(named: "ptt_launcher_icon"), for: .normal)
            self.messageText.resignFirstResponder()
        }
    }
    
    lazy var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    override func viewDidLoad() {
        let moreImage   = UIImage(named: "nav_more_icon")
        let callImage = UIImage(named: "call_icon")
        
        let moreButton   = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(switchToUserList))
        let callButton = UIBarButtonItem(image: callImage, style: .plain, target: self, action: #selector(activatePTT))
        self.navigationItem.rightBarButtonItems = [moreButton]
        self.navigationItem.hidesBackButton = false
        self.navigationItem.title = "Private chat"
        
        presenter?.fetchChannelHistory()
        ChatCollectionView.delegate = self
        ChatCollectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
        flowLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        flowLayout.minimumInteritemSpacing = 0.0
        ChatCollectionView.collectionViewLayout = flowLayout

        messageView.layer.borderWidth = 1.0
        messageView.layer.borderColor = UIColor.darkGray.cgColor
        let nib = UINib(nibName: "ChatMessageCell", bundle: nil)
        ChatCollectionView.register(nib, forCellWithReuseIdentifier: "ChatMessageCell")
        DispatchQueue.global(qos: .userInitiated).async {
            MessageData.shared.getMessages(count: 10) { messages in
                DispatchQueue.main.async {
                    self.messageList = messages
                    self.ChatCollectionView.reloadData()
                }
            }
        }
        NotificationCenter.default.addObserver(self, selector: #selector(ConversationViewController.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ConversationViewController.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if (isPTTEnabled) {
            isPTTEnabled = !isPTTEnabled
            self.ChatCollectionViewHeightConst.constant -= self.messageViewHightConst.constant
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        isPTTEnabled = !isPTTEnabled
            self.ChatCollectionViewHeightConst.constant += self.messageViewHightConst.constant
    }
    
    @objc func switchToUserList() {
        let channelStoryboard = UIStoryboard.init(name: "Channel", bundle: nil)
        guard let memberDetailVc = channelStoryboard.instantiateViewController(withIdentifier: "ChannelMemberListViewController") as? ChannelMemberListViewController else {
            return
        }
        self.navigationController?.pushViewController(memberDetailVc, animated: true)
    }
    
    @objc func activatePTT() {
        //todo hemanth
    }
}
extension ConversationViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = ChatCollectionView.dequeueReusableCell(withReuseIdentifier: "ChatMessageCell", for: indexPath) as? ChatMessageCell {
            let details: MesssageDetails = messageList[indexPath.row]
            cell.configure(senderName: details.sender.displayName, senderDate: details.sentDate, messageKind: details.kind)
            return cell
        }
        let emptyCell = ChatMessageCell()
        return emptyCell
    }
}
extension ConversationViewController: UICollectionViewDelegateFlowLayout {

}
