//
//  LandingViewController.swift
//  mcpttapp
//
//  Created by Sunil Kumar Yadav on 08/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    @IBOutlet weak var scrollPager: ScrollPager!
    
    static func makeViewController(collectionViewLayout: UICollectionViewLayout) -> LandingViewController {
        let landingViewController = LandingViewController.instantiateFromStoryboard("Dashboard", storyboardId: "LandingViewController")
        return landingViewController
    }
    
     var channelListViewController: ChannelListViewController?
    
     var contactListViewController: ContactListViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "MCPTT"
        navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
        
        scrollPager.delegate = self
        
         let channelStoryboard = UIStoryboard.init(name: "Channel", bundle: nil)
         channelListViewController = channelStoryboard.instantiateViewController(withIdentifier: "ChannelListViewController") as? ChannelListViewController
        let contactStoryboard = UIStoryboard.init(name: "Contact", bundle: nil)
        
        contactListViewController = contactStoryboard.instantiateViewController(withIdentifier: "ContactListViewController") as? ContactListViewController
        
        if let channelListViewController = channelListViewController {
            addChildViewController(channelListViewController)
            view.addSubview(channelListViewController.view)
            channelListViewController.didMove(toParentViewController: self)
        }
        
        if let contactListViewController = contactListViewController {
            addChildViewController(contactListViewController)
            view.addSubview(contactListViewController.view)
            contactListViewController.didMove(toParentViewController: self)
        }
        
        if let channelView = channelListViewController?.view, let contactListView = contactListViewController?.view {
            
            scrollPager.addSegmentsWithTitlesAndViews(segments: [
                ("Channels", channelView),
                ("Contacts", contactListView)
                ])
        }
        
        let settingImage = UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysTemplate)
        let settingButton = UIBarButtonItem(image: settingImage, style: .plain, target: self, action: #selector(handleSettings))
        settingButton.tintColor = UIColor.black
        
        navigationItem.rightBarButtonItems = [settingButton]
    }
    
    @objc func handleSettings() {
        let settingStoryboard = UIStoryboard.init(name: "Setting", bundle: nil)
        guard let settingViewController = settingStoryboard.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else {
            return
        }
        self.navigationController?.pushViewController(settingViewController, animated: true)
    }
}
extension LandingViewController: ScrollPagerDelegate {
    func scrollPager(scrollPager: ScrollPager, changedIndex: Int) {
        print("scrollPager index changed: \(changedIndex)")
    }
}
