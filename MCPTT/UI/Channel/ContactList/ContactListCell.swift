//
//  ContactListCell.swift
//  mcpttapp
//
//  Created by Toor, Sanju on 03/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

class ContactListCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    var contactListArray : [String] = ["Contact1", "contact2","contact3","contact4","contact5","contact6","contact7","contact8","contact9","contact10"]
    
    let ContactListCell = "ChannelMenuCell"
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
       ///I have added menu cell only for checking/demo, need to add contact Cell here,
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: ContactListCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contactListArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        ///I have added menu cell only for checking/demo, need to add contact Cell here,
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContactListCell, for: indexPath) as? MenuCell else {
            return UICollectionViewCell()
        }
        cell.menuBarLabel.text = contactListArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
