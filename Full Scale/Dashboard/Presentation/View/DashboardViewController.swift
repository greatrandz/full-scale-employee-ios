//
//  DashboardViewController.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 14/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

final class DashboardViewController: UIViewController {

    private let viewModel: DashboardViewModel
    @IBOutlet private var collectionView: UICollectionView!
    @IBOutlet private var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    init(viewModel: DashboardViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: DashboardViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem?.setTitlePositionAdjustment(.init(horizontal: 10, vertical: 210), for: UIBarMetrics.default)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCustomNavigationBar()
        configureSideNavigationDrawer()
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView.contentInset.top = 12
        viewModel.configure(collectionView: collectionView, flowLayout: collectionViewFlowLayout)
    }
    
    private func configureSideNavigationDrawer() {
        let coordinator = SideMenuCoordinator(navigationController: navigationController!)
        let viewModel = SideMenuViewModel(coordinator: coordinator)
        let view = SideMenuView(viewModel: viewModel)
        RDNavigationDrawer
            .left(
                    target: self,
                    view: view,
                    percentage: 82,
                    isTopMost: false
            )
    }
    
    private func configureCustomNavigationBar() {
        let image = UIImage(named: "hamburger-menu")
        let hamburgerMenu = UIBarButtonItem(image: image,
                                            style: .plain, target: self, action: #selector(menuButtonAction))
        
        let viewButton: UIButton = UIButton(type: .custom)
        viewButton.setImage(UIImage(named: "fs-navigation-title"), for: [])
        viewButton.imageEdgeInsets = UIEdgeInsets(top: -12, left: -10, bottom: -8, right: 0)
        viewButton.isUserInteractionEnabled = false
        let fullscaleTitle = UIBarButtonItem(customView: viewButton)
        
        self.navigationItem.leftBarButtonItems = [hamburgerMenu, fullscaleTitle]
        
        ///====================================================================================
        
        let searchController = UISearchController(searchResultsController: nil)
        if let searchField = searchController.searchBar.value(forKey: "_searchField") as? UITextField {
            searchField.borderStyle = .none
            searchField.backgroundColor = .white
            searchController.searchBar.frame.size.width = view.bounds.width * 0.80
        }
        
        if Device.isHorizontal {
            //let searchBar = UIBarButtonItem(customView: searchController.searchBar)
            //self.navigationItem.rightBarButtonItems = [searchBar]
        }
    }
    
    @objc func menuButtonAction() {
        RDNavigationDrawer.sideToggle()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.reloadData()
    }


}
