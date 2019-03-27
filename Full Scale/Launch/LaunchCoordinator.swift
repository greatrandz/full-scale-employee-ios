//
//  LaunchCoordinator.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 27/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

struct LaunchCoordinator: Coordinator {
    private(set) weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    enum scene {
        case login
        case dashboard
    }
    
    func start() {
        let service = LaunchService()
        let viewModel = LaunchViewModel(coordinator: self, service: service)
        let viewController = LaunchViewController(viewModel: viewModel)
        navigationController?.navigationBar.isHidden = true
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    
}
