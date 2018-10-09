//
//  ChannelListViewController.swift
//  mcpttapp
//
//  Created by Sunil Kumar Yadav on 08/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

class ChannelListViewController: UIViewController {
    
    fileprivate var idleChannelListArray: [Channel]?
    fileprivate var activeChannelListArray: [Channel]?
    fileprivate var icFabButton = UIButton()
    
    let screenSize = UIScreen.main.bounds
    @IBOutlet weak var chaneelCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        chaneelCollectionView.register(UINib.init(nibName: "ChannelCell", bundle: nil), forCellWithReuseIdentifier: "ChannelCell" )
        chaneelCollectionView.register(UINib.init(nibName: "SectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header")
        fetchChannelList()
    }
    
    func fetchChannelList() {
        ChannelListViewModel.shared.fetchChannelData(completion: { (idleChannelArray: [Channel], activeChannelArray: [Channel]?) in
            self.idleChannelListArray = idleChannelArray
            self.activeChannelListArray = activeChannelArray
            self.chaneelCollectionView.reloadData()
        })
    }
}
extension ChannelListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as? SectionHeaderCell else {
            return UICollectionReusableView()
        }
        view.headerNameLabel.text = indexPath.section == 0 ? "Active" : "Idle"
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: screenSize.width, height: 30)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return activeChannelListArray?.count ?? 0
        } else {
            return idleChannelListArray?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChannelCell", for: indexPath) as? ChannelCell else {
            return UICollectionViewCell()
        }
        cell.separatorView.isHidden = true
        if indexPath.section == 0 {
            cell.channel = activeChannelListArray?[indexPath.row]
            cell.countStatusLabel.isHidden = true
            cell.channelIconImage.isHidden = true
            return cell
            
        } else {
            cell.channel = idleChannelListArray?[indexPath.row]
            cell.separatorView.isHidden = false
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenSize.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let channelStoryboard = UIStoryboard.init(name: "ConversationView", bundle: nil)
        guard let conversationViewController = channelStoryboard.instantiateViewController(withIdentifier: "ConversationViewController") as? ConversationViewController else {
            return
        }
        
        self.parent?.navigationController?.pushViewController(conversationViewController, animated: true)
    }
    
}
