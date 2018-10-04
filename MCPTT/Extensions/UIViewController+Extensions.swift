//
//  UIViewController+Extensions.swift
//  mcpttapp
//
//  Created by Niranjan, Rajabhaiya on 03/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

extension UIViewController {
    
    class func instantiate(storyboardName: String, storyboardId: String) -> Self {
        return instantiateFromStoryboardHelper(storyboardName, storyboardId: storyboardId)
    }
    
    class func instantiate(storyboardName: String, storyboardId: String, bundle: Bundle ) -> UIViewController {
        return instantiateFromStoryboardHelper(storyboardName, storyboardId: storyboardId, bundle: bundle)
    }
    
    class func instantiateInitialViewControllerFromStoryboard(_ storyboardName: String) -> Self {
        return instantiateFromStoryboardHelper(storyboardName, storyboardId: nil)
    }
    
    class func instantiateFromStoryboard(_ storyboardName: String, storyboardId: String) -> Self {
        return instantiateFromStoryboardHelper(storyboardName, storyboardId: storyboardId)
    }
    
    class func instantiateInitialViewController(storyboardName: String) -> Self {
        return instantiateFromStoryboardHelper(storyboardName, storyboardId: nil)
    }
    
    class func instantiateInitialViewController(storyboardName: String, bundle: Bundle ) -> UIViewController {
        return instantiateFromStoryboardHelper(storyboardName, storyboardId: nil, bundle: bundle)
    }
    
    fileprivate class func instantiateFromStoryboardHelper<T>(_ storyboardName: String, storyboardId: String?, bundle: Bundle? = nil) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle ?? Bundle(for: self))
        switch storyboardId {
        case .some(let id):
            guard let controller = storyboard.instantiateViewController(withIdentifier: id) as? T else {
                let message = "View controller of type \(T.self) does not exist in storyboard \(storyboardName) with identifier \(id)"
                fatalError(message)
            }
            return controller
        case nil:
            guard let controller = storyboard.instantiateInitialViewController() as? T else {
                let message = "View controller of type \(T.self) is not the initial view controller in storyboard \(storyboardName)"
                fatalError(message)
            }
            return controller
        }
    }
}
