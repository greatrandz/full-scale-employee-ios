//
//  AppCoordinator.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 27/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

struct AppCoodinator: Coordinator {

    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    var navigationController: UINavigationController? {
        return window.rootViewController as? UINavigationController
    }
    
    func start() {
        
        let rootNavigationController = configuredNavigationController
        let coordinator = LaunchCoordinator(navigationController: rootNavigationController)
        coordinator.start()
        window.makeKeyAndVisible()
        window.rootViewController = rootNavigationController
    }
    
}
