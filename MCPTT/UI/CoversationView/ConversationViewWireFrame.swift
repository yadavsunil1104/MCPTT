//
//  ConversationViewWireFrame.swift
//  mcpttapp
//
//  Created by Hemanth Kumar H N on 01/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation
import UIKit

class ConversationViewWireFrame:CVPresenterToCVRouterProtocal {
   static func createModule() -> ConversationViewController {
        
    if let view = UIStoryboard(name: "CoversationView", bundle: Bundle.main).instantiateViewController(withIdentifier: "ConversationViewController") as? ConversationViewController {
        return view
    }
     let conversationView = ConversationViewController()
     return conversationView
    }
}
