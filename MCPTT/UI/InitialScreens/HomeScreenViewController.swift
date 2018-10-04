//
//  HomeScreenViewController.swift
//  MCPTT
//
//  Created by Niranjan, Rajabhaiya on 10/09/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

final class HomeScreenViewController: UIViewController {

    var counterTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view, typically from a nib.
//        counterTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(startAppFlow), userInfo: nil, repeats: false)
//        counterTimer.fire()
    }

    @IBAction func loginButtonAction(_ sender: Any) {
        /// Calling of ChannelView Controller
        let layout = UICollectionViewFlowLayout()
        let vc = ChannelViewContoller.makeViewController(collectionViewLayout: layout)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func startAppFlow() {
        counterTimer.invalidate()
        guard CommonUtility.isAlreadyLunched() else {
            let termViewContoller = TermAndConditionViewController.instantiateFromStoryboard("Main", storyboardId: "TermAndCondition")
            navigationController?.pushViewController(termViewContoller, animated: true)
            return
        }
    }

}
