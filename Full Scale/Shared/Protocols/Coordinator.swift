//
//  Coordinator.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 26/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get }
    func start()
}

extension Coordinator {
    
    var configuredNavigationController: UINavigationController {
        let navigationController = UINavigationController()
        navigationController.navigationBar.isHidden = false
        navigationController.navigationBar.barTintColor = UIColor(hex: "#028740")
        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.titleTextAttributes = [ .foregroundColor: UIColor.white]
        navigationController.navigationBar.isTranslucent = false
        
        return navigationController
    }
    
    func presentDashboard() {
        guard let navigationController = self.navigationController else {
            return
        }
        
        let coordinator = DashboardCoordinator(navigationController: navigationController)
        coordinator.start()
    }
    
    func presentLogin() {
        guard let navigationController = self.navigationController else {
            return
        }
        
        let coordinator = LoginCoordinator(navigationController: navigationController)
        coordinator.start()
    }
    
    func dismiss(animated: Bool = true) {
        navigationController?.dismiss(animated: animated)
    }
    
}
