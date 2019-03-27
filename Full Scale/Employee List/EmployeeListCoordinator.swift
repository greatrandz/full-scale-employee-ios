//
//  EmployeeListCoordinator.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 21/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

struct EmployeeListCoordinator {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
