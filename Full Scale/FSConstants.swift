//
//  FSConstants.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 26/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import Foundation
enum FSConstants {
    
    static let fsClientID: String = {
        return Bundle.main.object(forInfoDictionaryKey: FSEnvironmentVariables.FS_CLIENT_ID) as? String ?? ""
    }()
    
    static let fsAPIURL: String = {
        return Bundle.main.object(forInfoDictionaryKey: FSEnvironmentVariables.FS_API_URL) as? String ?? ""
    }()
    
    static let fsSecretKey: String = {
        return Bundle.main.object(forInfoDictionaryKey: FSEnvironmentVariables.FS_SECRET_KEY) as? String ?? ""
    }()
    
}
