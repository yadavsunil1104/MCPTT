//
//  ContactListViewController.swift
//  MCPTTv2
//
//  Created by Raju Maramulla on 04/10/18.
//  Copyright © 2018 Raju Maramulla. All rights reserved.
//

import Foundation
import UIKit

private let reuseIdentifier = "Cell"

private let currUserCellId = "currUserCell"
private let currUserGroupsCellId = "currUserGroupsCell"
private let currUserContactsCellId = "currUserContactsCell"

class ContactListViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let screenSize = UIScreen.main.bounds

    var currUserName = "Jeanette McHale"
    var currMCID  = "MCID"
    
    var groups = [
        "group 1": ["Name 1", "Name2", "Name3"],
        "group 2":["Name 4", "Name5", "Name6"]
    ]
    
    var groupNames = ["Special TF A(999)"]
    
    //var groupNames = [String](groups.keys)
    
    var names = ["Aiden Walker", "Alexander McHale", "Alice Brown", "Name 4", "Name 5", "Name 6"]
    var MCIDs = ["MCID", "MCID", "MCID", "MCID 4", "MCID 5", "MCID 6"]
    
    var borderColor: CGColor! = UIColor.clear.cgColor
    var borderWidth: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        setupICFabButtons()
        setupScrollToTopButton()
        
        collectionView?.register(UINib.init(nibName: "userCell", bundle: nil), forCellWithReuseIdentifier:"currUserCell")
        collectionView?.register(UINib.init(nibName: "userGroupCell", bundle: nil), forCellWithReuseIdentifier:"currUserGroupsCell")
        collectionView?.register(UINib.init(nibName: "userContactCell", bundle: nil), forCellWithReuseIdentifier:"currUserContactsCell")
        
        collectionView?.register(UINib.init(nibName: "userHeader", bundle: nil), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader , withReuseIdentifier: "UserHeader")
        
        let cellSize = CGSize(width: view.frame.width, height: 100)

        let layout = UICollectionViewFlowLayout()
        //layout.scrollDirection = .vertical //.horizontal
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        collectionView?.setCollectionViewLayout(layout, animated: true)

        collectionView?.reloadData()
    }
    
    func setupICFabButtons() {
        let icFabButton = UIButton.init(frame: CGRect(x: screenSize.width-50-15, y: screenSize.height-50-25, width: 55, height: 55))
        icFabButton.setTitle("IC", for: .normal)
        icFabButton.backgroundColor = UIColor.darkGray
        icFabButton.layer.cornerRadius = 27
        icFabButton.layer.masksToBounds = true
        icFabButton.layer.zPosition = 1
        icFabButton.addTarget(self, action: #selector(icFabpressed), for: .touchUpInside)
        icFabButton.isUserInteractionEnabled = true
        view.insertSubview(icFabButton, at: 0)
    }
    
    func setupScrollToTopButton(){
        let scrollToTopButton = UIButton.init(frame: CGRect(x: screenSize.width/2, y: screenSize.height-30-10, width: 30, height: 30))
        scrollToTopButton.setTitle("^", for: .normal)
        scrollToTopButton.backgroundColor = UIColor.darkGray
        scrollToTopButton.layer.cornerRadius = 15
        scrollToTopButton.layer.masksToBounds = true
        scrollToTopButton.layer.zPosition = 1
        scrollToTopButton.addTarget(self, action: #selector(scrollToToppressed), for: .touchUpInside)
        scrollToTopButton.isUserInteractionEnabled = true
        view.insertSubview(scrollToTopButton, at: 0)
    }
    
    @objc func scrollToToppressed() {
        print("scroll to top")
    }
    
    @objc func icFabpressed() {
        print("fab pressed")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return CGSize.init(width: screenSize.width, height: 30)
        case 1:
            return CGSize.init(width: screenSize.width, height: 30)
        default:
            return CGSize.init(width: screenSize.width, height: 30)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
         let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "UserHeader", for: indexPath) as? UserHeader
        switch (indexPath.section) {
        case 0:
            
            view?.meHeaderNameLabel.text = "Me"
            
            return view ?? UICollectionReusableView()
        case 1:
            
            view?.meHeaderNameLabel.text = "Groups"
            
            return view ?? UICollectionReusableView()
        default:
            
            view?.meHeaderNameLabel.text = "A  "
            
            return view ?? UICollectionReusableView()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else if section == 1 {
            return groupNames.count
        } else {
            return names.count
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        /*let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactCell", for: indexPath) as! contactCell
         
         cell.contactName.text = contactListArray[indexPath.row]
         cell.contactMCID.text = mcidListArray[indexPath.row]
         
         
         return cell
         */
        
        switch (indexPath.section) {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "currUserCell", for: indexPath) as? CurrUserCell
            
            cell?.currUserName.text = currUserName
            cell?.currUserMCID.text = currMCID
            
            return cell ?? UICollectionViewCell()
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "currUserGroupsCell", for: indexPath) as? CurrUserGroupsCell
            
            cell?.currUserGroupName.text = groupNames[indexPath.row]
            
            return cell ?? UICollectionViewCell()
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "currUserContactsCell", for: indexPath) as? CurrUserContactsCell
            cell?.currUserContactName.text = names[indexPath.row]
            cell?.currUserContactMCID.text = MCIDs[indexPath.row]
            
            return cell ?? UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenSize.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
