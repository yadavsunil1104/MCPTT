//
//  ChannelListCellCollectionViewCell.swift
//  mcpttapp
//
//  Created by Toor, Sanju on 03/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

class ChannelListCell: BaseCell,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

   fileprivate var idleChannelListArray : [Channel]?
   fileprivate var activeChannelListArray : [Channel]?
   fileprivate var icFabButton = UIButton()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()

    func fetchChannelList() {
        ChannelListViewModel.shared.fetchChannelData(completion: { (idleChannelArray : [Channel], activeChannelArray : [Channel]?) in
            self.idleChannelListArray = idleChannelArray
            self.activeChannelListArray = activeChannelArray
            self.collectionView.reloadData()
        })
    }

    override func setupViews() {
        super.setupViews()

        fetchChannelList()
        setupCollectionViewLayout()
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(UINib.init(nibName: "ChannelCell", bundle: nil), forCellWithReuseIdentifier:"ChannelCell" )
        collectionView.register(UINib.init(nibName: "SectionHeaderView", bundle: nil), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader , withReuseIdentifier: "Header")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! SectionHeaderCell
        view.headerNameLabel.text = indexPath.section == 0 ? "Active" : "Idle"
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: frame.width, height: 30)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return activeChannelListArray?.count ?? 0
        } else {
            return idleChannelListArray?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChannelCell", for: indexPath) as! ChannelCell
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
        return CGSize(width:frame.width, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   
    
    /// Did Select Method of Cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}


extension ChannelListCell {

    private func setupCollectionViewLayout() {
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
            flowLayout.minimumLineSpacing = 0
        }
    }
}
