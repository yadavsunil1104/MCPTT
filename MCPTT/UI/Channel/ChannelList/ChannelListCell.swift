//
//  ChannelListCellCollectionViewCell.swift
//  mcpttapp
//
//  Created by Toor, Sanju on 03/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

class ChannelListCell: BaseCell {

   fileprivate var idleChannelListArray: [Channel]?
   fileprivate var activeChannelListArray: [Channel]?
   fileprivate var icFabButton = UIButton()
    
//    lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.backgroundColor = UIColor.white
//        cv.dataSource = self
//        cv.delegate = self
//        return cv
//    }()

    func fetchChannelList() {
        ChannelListViewModel.shared.fetchChannelData(completion: { (idleChannelArray: [Channel], activeChannelArray: [Channel]?) in
            self.idleChannelListArray = idleChannelArray
            self.activeChannelListArray = activeChannelArray
            //self.collectionView.reloadData()
        })
    }

    override func setupViews() {
        super.setupViews()

        fetchChannelList()
        //setupCollectionViewLayout()
        
//        addSubview(collectionView)
//        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
//        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
    }
    
    /// Did Select Method of Cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}

extension ChannelListCell {

//    private func setupCollectionViewLayout() {
//        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.scrollDirection = .vertical
//            flowLayout.minimumLineSpacing = 0
//        }
//    }
}
