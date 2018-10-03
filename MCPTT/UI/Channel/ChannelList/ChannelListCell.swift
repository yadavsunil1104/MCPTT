//
//  ChannelListCellCollectionViewCell.swift
//  mcpttapp
//
//  Created by Toor, Sanju on 03/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

class ChannelListCell: BaseCell,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var channelListArray : [String] = ["Channel1","Channel2","Channel3","Channel4","Channel5","Channel6","Channel7","Channel8","Channe9","Channe10"]
    let ChannelListCell = "ChannelListCell"
    let ActiveHeader = "ActiveHeader"
    let IdleHeader = "IdleHeader"

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()

    override func setupViews() {
        super.setupViews()
        setupCollectionViewLayout()

        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(UINib.init(nibName: "channelCell", bundle: nil), forCellWithReuseIdentifier:"ChannelCell" )
       // collectionView.register(channelCell.self, forCellWithReuseIdentifier: ChannelListCell)
        collectionView.register(channelCell.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader , withReuseIdentifier: ActiveHeader)
        collectionView.register(channelCell.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader , withReuseIdentifier: IdleHeader)

    }
    
    func setupCollectionViewLayout() {
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
            flowLayout.minimumLineSpacing = 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: ActiveHeader, for: indexPath)
        view.backgroundColor = UIColor.gray
        return view
        } else {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: IdleHeader, for: indexPath)
            view.backgroundColor = UIColor.gray
            return view
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: frame.width, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
        return channelListArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChannelCell", for: indexPath) as! channelCell
        
        cell.channelName.text = "Sanju Toor"
       // cell.broadcastIconImage.image = UIImage(imageLiteralResourceName: "nav_more_icon")
        return cell
        
//        if indexPath.section == 0 {
//            cell.channelName?.text = "Sanju"
//            return cell
//
//        } else {
//            cell.channelName?.text = channelListArray[indexPath.row]
//            return cell
//        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:frame.width, height: 100)
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   
}
