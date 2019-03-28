//
//  NetworkManager.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 26/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import Foundation
import Alamofire

final class NetworkManager: RequestRetrier {
    
    private var retriedRequests: [String: Int] = [:]
    
    class var shared: NetworkManager {
        struct Static {
            static let instance = NetworkManager()
        }
        return Static.instance
    }
    
    private let sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 120 // 120 seconds
        configuration.httpMaximumConnectionsPerHost = 4 //doesnt work...
        return SessionManager(configuration: configuration)
    }()
    
    func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        
        if let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 {
            NotificationCenter.default.post(name: .forceLogout, object: nil)
        }
            
        guard
            request.task?.response == nil,
            let url = request.request?.url?.absoluteString
            else {
                removeCachedUrlRequest(url: request.request?.url?.absoluteString)
                completion(false, 0.0) // don't retry
                return
        }
        
        guard let retryCount = retriedRequests[url] else {
            retriedRequests[url] = 1
            completion(true, 1.0) // retry after 1 second
            return
        }
        
        if retryCount <= 3 {
            retriedRequests[url] = retryCount + 1
            completion(true, 1.0) // retry after 1 second
        } else {
            removeCachedUrlRequest(url: url)
            completion(false, 0.0) // don't retry
        }
        
    }
    
    func request(_ urlRequest: URLRequestConvertible, completionHandler: @escaping ((_ responseObject: DataResponse<Any>) -> Void)) {
        sessionManager.request(urlRequest).responseJSON(completionHandler: completionHandler)
    }
    
    private func removeCachedUrlRequest(url: String?) {
        guard let url = url else {
            return
        }
        retriedRequests.removeValue(forKey: url)
    }
    
    
}

