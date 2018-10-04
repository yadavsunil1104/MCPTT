//
//  SettingsViewController.swift
//  mcpttapp
//
//  Created by Sunil Kumar Yadav on 01/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsTableView: UITableView!
    lazy var viewModel: SettingsViewModel = {
        return SettingsViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initVM()
    }
    
    func initVM() {
        viewModel.initFetch()
        settingsTableView.reloadData()
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return viewModel.defaultSettings.count
        case 1:
            return viewModel.messageSettings.count
        default:
            return 1
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            if indexPath.row == 3 {
                let cell = getMessageSettingsTableViewCell(tableView: tableView, indexPath: indexPath)
                cell.titleLabel.text = viewModel.defaultSettings[indexPath.row].title
                return cell
            } else {
                let cell = getDefaultSettingsTableViewCell(tableView: tableView, indexPath: indexPath)
                cell.titleLabel.text = viewModel.defaultSettings[indexPath.row].title
                cell.subTitleLabel.text = viewModel.defaultSettings[indexPath.row].subTitle
                return cell
            }
        case 1:
            let cell = getMessageSettingsTableViewCell(tableView: tableView, indexPath: indexPath)
            cell.titleLabel.text = viewModel.messageSettings[indexPath.row].title
            return cell
        default:
            let cell = getMessageSettingsTableViewCell(tableView: tableView, indexPath: indexPath)
            if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] {
             cell.titleLabel.text = "PTT Version: \(version)"
            }
            cell.switchButton.isHidden = true
            return cell
        }
    }
    
    func getDefaultSettingsTableViewCell(tableView: UITableView, indexPath: IndexPath) -> SettingsTableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as? SettingsTableViewCell else {
            fatalError("Cell not exists in storyboard")
        }
        return cell
    }
    func getMessageSettingsTableViewCell(tableView: UITableView, indexPath: IndexPath) -> MessageSettingsTableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MessageSettingsTableViewCell", for: indexPath) as? MessageSettingsTableViewCell else {
            fatalError("Cell not exists in storyboard")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
        switch section {
        case 1:
            return "Message Notification"
        case 2:
            return "Version"
        default:
            return nil
        }
    
    }
}
