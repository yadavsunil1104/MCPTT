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
        navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view, typically from a nib.
        counterTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(startAppFlow), userInfo: nil, repeats: false)
        counterTimer.fire()
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
