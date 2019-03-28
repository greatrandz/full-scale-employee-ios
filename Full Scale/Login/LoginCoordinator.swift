//
//  LoginCoordinator.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 25/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

struct LoginCoordinator: Coordinator {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let network = LoginNetworkService()
        let viewModel = LoginViewModel(coordinator: self, network: network)
        let viewController = LoginViewController(viewModel: viewModel)
        navigationController?.navigationBar.isHidden = true
        DispatchQueue.main.async {
            self.navigationController?.setViewControllers([viewController], animated: false)
        }
    }
    
}
