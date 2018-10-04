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
        setupICFabButtons()
        setupScrollToTopButton()
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(UINib.init(nibName: "ChannelCell", bundle: nil), forCellWithReuseIdentifier:"ChannelCell" )
        collectionView.register(UINib.init(nibName: "SectionHeaderView", bundle: nil), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader , withReuseIdentifier: "Header")

    }
    
    func setupICFabButtons() {
        let icFabButton = UIButton.init(frame: CGRect(x: frame.width-50-15, y: frame.height-50-25, width: 55, height: 55))
        icFabButton.setTitle("IC", for: .normal)
        icFabButton.backgroundColor = UIColor.darkGray
        icFabButton.layer.cornerRadius = 27
        icFabButton.layer.masksToBounds = true
        icFabButton.layer.zPosition = 1
        icFabButton.addTarget(self, action: #selector(icFabpressed), for: .touchUpInside)
        icFabButton.isUserInteractionEnabled = true
        insertSubview(icFabButton, at: 0)
    }
    
    func setupScrollToTopButton(){
        let scrollToTopButton = UIButton.init(frame: CGRect(x: frame.width/2, y: frame.height-30-10, width: 30, height: 30))
        scrollToTopButton.setTitle("^", for: .normal)
        scrollToTopButton.backgroundColor = UIColor.darkGray
        scrollToTopButton.layer.cornerRadius = 15
        scrollToTopButton.layer.masksToBounds = true
        scrollToTopButton.layer.zPosition = 1
        scrollToTopButton.addTarget(self, action: #selector(scrollToToppressed), for: .touchUpInside)
        scrollToTopButton.isUserInteractionEnabled = true
        insertSubview(scrollToTopButton, at: 0)
    }
    
    @objc func scrollToToppressed() {
        print("scroll to top")
    }
    
    @objc func icFabpressed() {
        print("fab pressed")
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
       let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! SectionHeaderCell
        view.headerNameLabel.text = indexPath.section == 0 ? "Active" : "Idle"
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: frame.width, height: 30)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
        return channelListArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChannelCell", for: indexPath) as! ChannelCell
        cell.separatorView.isHidden = true
        if indexPath.section == 0 {
            cell.channelName?.text = "LAPD"
            cell.channelStatusIcon.image = UIImage(imageLiteralResourceName: "ActiveChannel_Image")
            cell.statusDescriptionLabel.text = "%s speakes for %d sec"
            cell.countStatusLabel.isHidden = true
            return cell

        } else {
            cell.separatorView.isHidden = false
            cell.channelName?.text = channelListArray[indexPath.row]
            cell.broadcastIconImage.image = UIImage(imageLiteralResourceName: "nav_more_icon")
            cell.channelStatusIcon.image = UIImage(imageLiteralResourceName: "IdleChannel_Image")
            cell.statusDescriptionLabel.text = "%s speakes for %d sec"
            cell.countStatusLabel.text = "2"
            cell.statusDescriptionIconImage.image = UIImage(imageLiteralResourceName: "Call_Missed_Icon")
            cell.channelIconImage.image = UIImage(imageLiteralResourceName: "Emergency_Icon")
            cell.broadcastIconImage.image = UIImage(imageLiteralResourceName: "Broadcast_Icon")
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
