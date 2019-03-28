//
//  NetworkManager.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 26/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

protocol LoadService {
    associatedtype T
    associatedtype P
    
    func load(parameters: P) -> Observable<T>
}

protocol NetworkApiService: LoadService {
    
    func headers() -> [String: String]
    
    func url() throws -> URL
    
    func result(data: Data?, observer: AnyObserver<T>) throws
}

extension NetworkApiService {
    
     func headers() -> [String: String] {
        
        var headers = [String: String]()
        headers["Accept"] = "application/json"
        headers["Content-Type"] = "application/json"
        
        
        //headers["Authorization"] = "Bearer asdfasdfasdfasdf"
        
        return headers
    }
    
    func put(url: URL, parameters: Any?, observer: AnyObserver<T>) {
        let networkManager = NetworkManager.shared
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.put.rawValue
        request.allHTTPHeaderFields = headers()
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters ?? [], options: .prettyPrinted)
        
        networkManager.request(request) { (response) in
            self.onResponse(response: response, observer: observer)
        }
    }
    
    func post(url: URL, parameters: [String: Any]?, observer: AnyObserver<T>) {
        print("requestURL: \(url.absoluteString)")
        let networkManager = NetworkManager.shared
        
        print("headerTest: \(String(describing: parameters))")
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.allHTTPHeaderFields = headers()
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters ?? [], options: .prettyPrinted)
        
        networkManager.request(request) { (response) in
            self.onResponse(response: response, observer: observer)
        }
    }
    
    func get(url: URL, parameters: [String: Any]?, encoding: ParameterEncoding = JSONEncoding.default, observer: AnyObserver<T>) {
        let networkManager = NetworkManager.shared
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        request.allHTTPHeaderFields = headers()
        let encodedRequest = try! encoding.encode(request, with: parameters)
        
        networkManager.request(encodedRequest) { (response) in
            self.onResponse(response: response, observer: observer)
        }
    }
    
    private func onResponse(response: DataResponse<Any>, observer: AnyObserver<T>) {
        let responseResult = response.result
        
        do {
            if responseResult.isSuccess {
                try self.result(data: response.data, observer: observer)
            }
            else if let error = responseResult.error as NSError? {
                observer.onError(error)
            }
        }
        catch let error {
            observer.onError(error)
        }
    }
    
}
