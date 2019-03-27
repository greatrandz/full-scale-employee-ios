//
//  LaunchService.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 27/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import Foundation
import RxSwift

final class LaunchService {
    typealias T = LaunchCoordinator.scene
    
    func load() -> Observable<LaunchCoordinator.scene> {
        let observer = Observable<LaunchCoordinator.scene>
            .create { (observer) -> Disposable in
            
            self.launch(observer: observer)
            return Disposables.create()
        }
        return observer
    }
    
    private func launch(observer: AnyObserver<LaunchCoordinator.scene>) {
        
        guard let _ = Session.current else {
            observer.onNext(.login)
            observer.onCompleted()
            return
        }
        
        observer.onNext(.dashboard)
        observer.onCompleted()
    }
    
}
