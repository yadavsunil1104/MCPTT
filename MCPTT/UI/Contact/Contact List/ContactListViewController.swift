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

class ContactListViewController: UICollectionViewController {

    var currUserName = "Name 0"
    var currMCID  = "MCID 0"
    
    var groups = [
        "group 1": ["Name 1", "Name2", "Name3"],
        "group 2": ["Name 4", "Name5", "Name6"]
    ]
    
    var groupNames = ["group1", "group2"]
    
    //var groupNames = [String](groups.keys)
    
    var names = ["Name 1", "Name 2", "Name 3", "Name 4", "Name 5", "Name 6"]
    var MCIDs = ["MCID 1", "MCID 2", "MCID 3", "MCID 4", "MCID 5", "MCID 6"]
    
    var imgURLArray: [[String]] = [
        ["currUserImageURL"],
        ["","","","","",""],
        ["lisedUserImageURL 1", "lisedUserImageURL 2", "lisedUserImageURL 3",
         "listedUserImageURL 4", "lisedUserImageURL 5", "lisedUserImageURL 6"]
    ]
    
    var nameArray: [[String]] = [
        ["currUserName"],
        ["","","","","",""],
        ["listedUserName 1", "listedUserName 2", "listedUserName 3",
         "listedUserName 4", "listedUserName 5", "listedUserName 6"]
    ]
    
    var emailArray: [[String]] = [
        ["currUserEmail"],
        ["","",""],
        ["listedUserEmail 1", "listedUserEmail 2", "listedUserEmail 3",
         "listedUserEmail 4", "listedUserEmail 5", "listedUserEmail 6"]
    ]
    
    var groupArray: [[String]] = [
        ["currUserGroup"],
        ["","","","","",""],
        ["listedUserGroup 1", "listedUserGroup 2", "listedUserGroup 3",
         "listedUserGroup 4", "listedUserGroup 5", "listedUserGroup 6"]
    ]
    
    var borderColor: CGColor! = UIColor.clear.cgColor
    var borderWidth: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(CurrUserCell.self, forCellWithReuseIdentifier: currUserCellId)
        //self.collectionView!.register(CurrUserGroupsCell.self, forCellWithReuseIdentifier: currUserGroupsCellId)
        //self.collectionView!.register(CurrUserContactsCell.self, forCellWithReuseIdentifier: currUserContactsCellId)
        
        // Do any additional setup after loading the view.
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        switch (section) {
            case 0:
                return 1
            case 1:
                return groups.count
            default:
                return names.count
            }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch (indexPath.section) {
            case 0:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "currUserCell", for: indexPath) as? CurrUserCell else {
                    return UICollectionViewCell()
                }
                cell.currUserName.text = currUserName
                cell.currUserMCID.text = currMCID
                return cell
            case 1:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "currUserGroupsCell", for: indexPath) as? CurrUserGroupsCell else {
                    return UICollectionViewCell()
                }
                    cell.currUserGroupName.text = groupNames[indexPath.row]

                return cell
            default:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "currUserContactsCell", for: indexPath) as? CurrUserContactsCell else {
                    return UICollectionViewCell()
                }
                    cell.currUserContactName.text = names[indexPath.row]
                    cell.currUserContactMCID.text = MCIDs[indexPath.row]

                return cell
            }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        switch (indexPath.section) {
//        case 0:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "currUserCell", for: indexPath) as! CurrUserCell
//
//            performSegue(withIdentifier: "contactDetailSegueId", sender: cell)
//
//        case 1:
//            break
//            //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "currUserGroupsCell", for: indexPath) as! CurrUserGroupsCell
//            //Group View Controller
//
//        default:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "currUserContactsCell", for: indexPath) as! CurrUserContactsCell
//
//            performSegue(withIdentifier: "contactDetailSegueId", sender: cell)
//
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contactDetailSegueId"{
            if let destinationVC = segue.destination as? MemberDetailViewController {
                
                destinationVC.title = "Contact Detail"
                 /*
                 let selectedCell = sender //as! UICollectionViewCell
               
                 let indexPath = collectionView?.indexPath(for: selectedCell)
                 let sectionNumber = indexPath?.section
                 let rowNumber = indexPath?.row
                 
                 destinationVC.imageURLString = imgURLArray[sectionNumber!][rowNumber!]
                 destinationVC.nameString = nameArray[sectionNumber!][rowNumber!]
                 destinationVC.emailString = emailArray[sectionNumber!][rowNumber!]
                 destinationVC.groupString = groupArray[sectionNumber!][rowNumber!]
                 */
                
            }
            
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: 100)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
