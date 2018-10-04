//
//  CommonUtility.swift
//  mcpttapp
//
//  Created by Niranjan, Rajabhaiya on 03/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation

private let firstTimeLunchKey = "APPLUNCHED"

final class CommonUtility {
    
    static func appLaunchFirstTime() {
        UserDefaults.standard.set(true, forKey: firstTimeLunchKey)
    }
    
    static func isAlreadyLunched() -> Bool {
        let value = UserDefaults.standard.bool(forKey: firstTimeLunchKey)
        return value
    }
    
}
