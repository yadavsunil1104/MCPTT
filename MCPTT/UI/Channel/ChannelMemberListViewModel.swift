//
//  ChannelMemberListViewModel.swift
//  mcpttapp
//
//  Created by Sunil Kumar Yadav on 01/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation

final class ChannelMemberListViewModel {
    
    private var cellViewModels = [ChannelMemberListCellViewModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    var reloadTableViewClosure: (() -> Void)?
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    func initFetch() {
        processFetchedData()
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> ChannelMemberListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    private func processFetchedData() {
        // Need to delete this code once API integeration & Model class creation.
        if let path = Bundle.main.path(forResource: "channelmemberlist", ofType: "json") {
            do {
                
                 var vms = [ChannelMemberListCellViewModel]()
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? Dictionary<String, AnyObject>
                
                let memebers = jsonResult?["members"] as? [[String: String]]
                
                for member in memebers ?? [[:]] {
                    let memberListCellVm = ChannelMemberListCellViewModel.init(memberName: member["name"], memberEmail: member["email"], memberAvailablabilityStatus: member["availablity"], isMemeberInConatctList: false)
                    vms.append(memberListCellVm)
                    
                }
                self.cellViewModels = vms
                
            } catch {
                
            }
        }
    }
}

struct ChannelMemberListCellViewModel {
    let memberName: String?
    let memberEmail: String?
    let memberAvailablabilityStatus: String?
    let isMemeberInConatctList: Bool
}
