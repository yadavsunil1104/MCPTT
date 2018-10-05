//
//  ChannelDetailViewContoller.swift
//  mcpttapp
//
//  Created by Niranjan, Rajabhaiya on 12/09/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cellId"
private let ChannelListCellId = "ChannelListCellId"
private let ContactListCellId = "ContactListCellId"

final class ChannelViewContoller: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    static func makeViewController(collectionViewLayout: UICollectionViewLayout) -> ChannelViewContoller {
        let storyboard = UIStoryboard(name: "Channel", bundle: nil)
        let ChannelView = storyboard.instantiateViewController(withIdentifier: "ChannelViewContoller") as! ChannelViewContoller
        return ChannelView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width-32, height: view.frame.size.height))
        titleLabel.text = "MCPTT"
        navigationItem.titleView = titleLabel
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView?.backgroundColor = UIColor.white
        setupChannelMenuBar()
        setupNavBarButtons()
        setupCollectionView()
        setupICFabButtons()
        setupScrollToTopButton()
    }
    
    lazy var channelMenuBar: ChannelMenuBar = {
        let mb = ChannelMenuBar()
        mb.channelViewContoller = self
        return mb
    }()
    
    /// Enabling Scrolling to Particular Index path
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = NSIndexPath(row: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath as IndexPath, at: .centeredHorizontally, animated: false)
    }

    /// MARK: Scroll Delegate Method
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        channelMenuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x/2
    }

    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        let index = targetContentOffset.pointee.x / view.frame.width

        let indexPath = NSIndexPath(item: Int(index), section: 0)
        channelMenuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: UICollectionViewScrollPosition.centeredHorizontally)

    }


/// Collection's Delegate/DataSource Methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChannelListCellId, for: indexPath) as! ChannelListCell
             return cell

        } else {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContactListCellId, for: indexPath) as! ContactListCell
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: view.frame.width, height: view.frame.height-120)
    }
}

extension ChannelViewContoller {

    /// Setting Up Channel/Conatct Menu Bar
    private func setupChannelMenuBar() {
        navigationController?.hidesBarsOnSwipe = false
        
        view.addSubview(channelMenuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: channelMenuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(110)]", views: channelMenuBar)
    }
    
    /// Create a custom navigation button for "Settings"
    func setupNavBarButtons() {
        let settingImage = UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysTemplate)
        let settingButton = UIBarButtonItem(image:settingImage , style: .plain, target: self, action: #selector(handleSettings))
        settingButton.tintColor = UIColor.black
        
        navigationItem.rightBarButtonItems = [settingButton]
    }
    
    /// Setting up the horizontal collection view
    private func setupCollectionView() {
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }

        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(ChannelListCell.self, forCellWithReuseIdentifier: ChannelListCellId)
        collectionView?.register(ContactListCell.self, forCellWithReuseIdentifier: ContactListCellId)

        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)

        collectionView?.isPagingEnabled = true
    }
    
    // Action method of Setting's button
    @objc func handleSettings() {
        print("setting button pressed")
    }
    
    private func setupICFabButtons() {
        let icFabButton = UIButton.init(frame: CGRect(x: self.view.frame.width-50-15, y: self.view.frame.height-50-25, width: 55, height: 55))
        icFabButton.setTitle("IC", for: .normal)
        icFabButton.backgroundColor = UIColor.darkGray
        icFabButton.layer.cornerRadius = 27
        icFabButton.layer.masksToBounds = true
        icFabButton.layer.zPosition = 1
        icFabButton.addTarget(self, action: #selector(icFabpressed), for: .touchUpInside)
        icFabButton.isUserInteractionEnabled = true
        view.addSubview(icFabButton)
    }
    
    @objc func icFabpressed(_ sender: UIGestureRecognizer) {
        print("Create Channel Button Pressed")
    }
    
    private func setupScrollToTopButton(){
        let scrollToTopButton = UIButton.init(frame: CGRect(x: self.view.frame.width/2, y: self.view.frame.height-30-10, width: 30, height: 30))
        scrollToTopButton.setTitle("^", for: .normal)
        scrollToTopButton.backgroundColor = UIColor.darkGray
        scrollToTopButton.layer.cornerRadius = 15
        scrollToTopButton.layer.masksToBounds = true
        scrollToTopButton.layer.zPosition = 1
        scrollToTopButton.addTarget(self, action: #selector(scrollToToppressed), for: .touchUpInside)
        scrollToTopButton.isUserInteractionEnabled = true
        view.addSubview(scrollToTopButton)
    }
    
    @objc func scrollToToppressed() {
        print("scroll to top button pressed")

    }
}
