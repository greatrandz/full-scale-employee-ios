//
//  LaunchViewModel.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 27/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit
import RxSwift

final class LaunchViewModel {
    
    private let disposeBag = DisposeBag()
    private let coordinator: LaunchCoordinator
    private let service: LaunchService
    
    
    init(coordinator: LaunchCoordinator, service: LaunchService) {
        self.coordinator = coordinator
        self.service = service
    }
    
    func launch() {
        
        service.load()
            .subscribe(onNext: { (scene) in
                
                self.navigate(with: scene)
                
            }, onError: { (_) in },
               onCompleted: { }
        ).disposed(by: disposeBag)
        
    }
    
    private func navigate(with scene: LaunchCoordinator.scene) {
        switch scene {
        case .login:
            coordinator.presentLogin()
        case .dashboard:
            coordinator.presentDashboard()
        }
    }
    
}
