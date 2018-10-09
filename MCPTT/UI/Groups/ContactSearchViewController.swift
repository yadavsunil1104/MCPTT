//
//  ContactSearchViewController.swift
//  mcpttapp
//
//  Created by harman on 08/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

class ContactSearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIPickerViewDataSource, UIPickerViewDelegate,UITextFieldDelegate {
   
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var selectTypeTxtField: UITextField!
    
    var picker = UIPickerView()
    
    var contacts = ["Prashant"]
    var newContacts = ["Arvind","Hemanth","Raju","Sunil","Satish"]
    var mcIDS = ["1234","4567","3456","2345","5678"]
    
   var pickerData = ["Select","First Name","Second Name", "Email"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib.init(nibName: "ContactSearchHeaderCell", bundle: nil), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader , withReuseIdentifier: "ContactSearchCell")
        
        // Do any additional setup after loading the view.
        
        picker.dataSource = self
        picker.delegate = self
        selectTypeTxtField.inputView = picker
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "ContactSearchCell", for: indexPath) as? ContactHeaderCell
        view?.headerLabel?.text = indexPath.section == 0 ? "Contacts" : "Results"
        return view ?? UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 50, height: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return contacts.count
        } else {
            return newContacts.count
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newContactCell", for: indexPath) as? NewContactsCell
        
        if indexPath.section == 0 {
            cell?.nameLabel.text = contacts[indexPath.row]
            //cell.mcidLabel.text = mcIDS[indexPath.row]
            cell?.plusIcon.isHidden = true
            return cell ?? UICollectionViewCell()
            
        } else {
            cell?.nameLabel.text = newContacts[indexPath.row]
            cell?.mcidLabel.text = mcIDS[indexPath.row]
            
            return cell ?? UICollectionViewCell()
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
         selectTypeTxtField.text = pickerData[row]
       picker.isHidden = false
        picker.resignFirstResponder()
        
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    private func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        picker.isHidden = false
        return false
    }
    
}
