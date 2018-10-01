//
//  ChannelMemberListViewController.swift
//  mcpttapp
//
//  Created by Sunil Kumar Yadav on 01/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

final class ChannelMemberListViewController: UIViewController {
    @IBOutlet weak var memberListTableView: UITableView!
    
    lazy var viewModel: ChannelMemberListViewModel = {
        return ChannelMemberListViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Init the static view
        initView()
        
        // init view model
        initVM()
    }
    func initView() {
        
        self.navigationItem.title = "Memeber List"
//        memberListTableView.estimatedRowHeight = 64
//        memberListTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func initVM() {
        viewModel.initFetch()
        
        viewModel.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.memberListTableView.reloadData()
            }
        }
    }
}

extension ChannelMemberListViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelMemberListTableViewCell", for: indexPath) as? ChannelMemberListTableViewCell else {
            fatalError("Cell not exists in storyboard")
        }
        
         let cellVM = viewModel.getCellViewModel( at: indexPath )
         cell.configureChanneListCell(channelMemberListCellVM: cellVM)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let contactStoryboard = UIStoryboard.init(name: "Contact", bundle: nil)
        let memberDetailVc = contactStoryboard.instantiateViewController(withIdentifier: "MemberDetailViewController")
        self.navigationController?.pushViewController(memberDetailVc, animated: true)
    }
}
