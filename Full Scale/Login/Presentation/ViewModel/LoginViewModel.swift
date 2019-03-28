//
//  LoginViewModel.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 25/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit
import RxSwift

final class LoginViewModel {
    
    private let coordinator: LoginCoordinator
    private let network: LoginNetworkService
    private let disposeBag = DisposeBag()
    
    init(coordinator: LoginCoordinator, network: LoginNetworkService) {
        self.coordinator = coordinator
        self.network = network
    }
    
    func login(email: String, password: String) {
        
        let params = ["username": email, "password": password]
        network.load(parameters: params)
            .subscribe(onNext: { (response) in
                
                self.coordinator.presentDashboard()
                
            }, onError: { (error) in
                print("onERROR: \(error)")
                
            }, onCompleted: {
            
        }).disposed(by: disposeBag)
    }
    
}
