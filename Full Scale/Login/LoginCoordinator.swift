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
        guard let navigationController = self.navigationController else {
            return
        }
        
        let network = LoginNetworkService()
        let viewModel = LoginViewModel(coordinator: self, network: network)
        let viewController = LoginViewController(viewModel: viewModel)

        DispatchQueue.main.async {
            
            UIView.transition(with: navigationController.view,
                              duration: 0.5,
                              options: UIView.AnimationOptions.transitionCrossDissolve,
                              animations: {
                                navigationController.navigationBar.alpha = 0
                                navigationController.setViewControllers([viewController], animated: false)
                                
            }, completion: { (finished) in
                navigationController.navigationBar.alpha = 1
                navigationController.navigationBar.isHidden = true
            })
            
        }
    }
    
}
