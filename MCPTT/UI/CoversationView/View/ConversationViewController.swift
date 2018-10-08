//
//  ConversationViewController.swift
//  mcpttapp
//
//  Created by Hemanth Kumar H N on 01/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation
import UIKit

class ConversationViewController: UIViewController {
    
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var ChatCollectionView: UICollectionView!
    let refreshControl = UIRefreshControl()
    var presenter: CVViewToCVPresenter?
    var tableView: UITableView?
    var messageList: [MesssageDetails] = []
    
    lazy var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    override func viewDidLoad() {
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
            //todo
            MessageData.shared.getMessages(count: 10) { messages in
                DispatchQueue.main.async {
                    self.messageList = messages
                    self.ChatCollectionView.reloadData()
                }
            }
        }
    }
    
    @IBAction func moreOptionTap(_ sender: Any) {
        let channelStoryboard = UIStoryboard.init(name: "Channel", bundle: nil)
        guard let memberDetailVc = channelStoryboard.instantiateViewController(withIdentifier: "ChannelMemberListViewController") as? ChannelMemberListViewController else {
            return
        }
        self.navigationController?.pushViewController(memberDetailVc, animated: true)
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
