//
//  LoginViewContoller.swift
//  mcpttapp
//
//  Created by Niranjan, Rajabhaiya on 12/09/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit
import WebKit

final class LoginViewContoller: UIViewController {
    
    @IBOutlet private weak var continueButton: UIButton!
    @IBOutlet private weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL.init(string: "https://www.google.com/") else {
            return
        }
        // Do any additional setup after loading the view, typically from a nib.
        webView.load(URLRequest.init(url: url))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

private extension LoginViewContoller {
    @IBAction func continueButtonPressed() {
        CommonUtility.userLoggedIn(value: true)
        let layout = UICollectionViewFlowLayout()
        let vc = ChannelViewContoller.makeViewController(collectionViewLayout: layout)
        navigationController?.pushViewController(vc, animated: true)
    }
}
