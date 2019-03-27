//
//  LoginNetworkService.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 26/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import Foundation
import RxSwift

final class LoginNetworkService: NetworkApiService {
    typealias T = Session
    typealias P = [String: Any]?
    
    private let realm = RealmManager()
    
    private var path: String {
        return "api/auth/token"
    }
    
    func load(parameters: [String : Any]?) -> Observable<Session> {
        let observer = Observable<Session>.create { (observer) -> Disposable in
            
            self.requestLogin(parameters: parameters, observer: observer)
            return Disposables.create()
        }
        return observer
    }
    
    func data(result: Data?, observer: AnyObserver<Session>) throws {
        
        guard let session: Session = result?.decode() else {
            fatalError("Unable to decode session")
        }
        realm.update(object: session)
        observer.onNext(session)
        observer.onCompleted()
    }
    
    func url() throws -> URL {
        return URL(string: FSConstants.fsAPIURL + path)!
    }
    
    private func requestLogin(parameters: [String : Any]?, observer: AnyObserver<Session>) {
        do {
            let url = try self.url()
            var withParams = [String: Any]()
            withParams = parameters ?? [:]
            withParams["grant_type"] = "password"
            withParams["client_id"] = FSConstants.fsClientID
            withParams["client_secret"] = FSConstants.fsSecretKey
            post(url: url, parameters: withParams, observer: observer)
        }
        catch let error {
            observer.onError(error)
            return
        }
    }
    
    
}
