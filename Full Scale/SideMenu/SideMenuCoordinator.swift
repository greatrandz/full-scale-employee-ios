//
//  SideMenuCoordinator.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 15/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

struct SideMenuCoordinator: Coordinator {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func sideToggle() {
        RDNavigationDrawer.sideToggle()
    }
    
    func testPushViewController() {
        guard let navigationController = self.navigationController else { return }
        
        //RDNavigationDrawer.sideToggle()
        let coordinator = EmployeeListCoordinator(navigationController: navigationController)
        let viewModel = EmployeeListViewModel(coordinator: coordinator)
        let controller = EmployeeListViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func start() { }
    
}
