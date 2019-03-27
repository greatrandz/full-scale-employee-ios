//
//  LogoutHandler.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 27/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

final class LogoutHandler {
    private let coordinator: AppCoodinator
    
    init(coordinator: AppCoodinator) {
        self.coordinator = coordinator
        NotificationCenter.default.addObserver(self, selector: #selector(logout), name: .forceLogout, object: nil)
    }
    
    @objc private func logout() {
        coordinator.presentLogin()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
