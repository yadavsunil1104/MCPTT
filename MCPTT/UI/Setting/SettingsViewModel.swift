//
//  SettingsViewModel.swift
//  mcpttapp
//
//  Created by Sunil Kumar Yadav on 03/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation

final class SettingsViewModel {
    var defaultSettings = [SettingsCellViewModel]()
    var messageSettings = [SettingsCellViewModel]()
    
    func initFetch() {
        processFetchedData()
    }
    private func processFetchedData() {
       defaultSettings.append(SettingsCellViewModel.init(title: "Home Channel", subTitle: "_channel name_"))
       defaultSettings.append(SettingsCellViewModel.init(title: "Call Priority", subTitle: "PTT Call"))
       defaultSettings.append(SettingsCellViewModel.init(title: "Emergency group", subTitle: "_group name_"))
       defaultSettings.append(SettingsCellViewModel.init(title: "Message auto delete", subTitle: nil))
    
       messageSettings.append(SettingsCellViewModel.init(title: "Alert Tone", subTitle: nil))
       messageSettings.append(SettingsCellViewModel.init(title: "Vibration", subTitle: nil))
        
    }
}

struct SettingsCellViewModel {
    let title: String?
    let subTitle: String?
}
