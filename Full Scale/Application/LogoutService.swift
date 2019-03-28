//
//  LogoutService.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 28/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import Foundation

struct LogoutService {
    private let realm = RealmManager()
    
    func logout() {
        if let _ = Session.current {
            // REQUEST TO REMOVE SESSION IF APPLICABLE
        }
        
        realm.removeAll()
    }
}
