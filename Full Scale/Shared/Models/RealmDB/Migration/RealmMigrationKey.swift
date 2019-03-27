//
//  RealmMigrationKey.swift
//  TestRealm
//
//  Created by Randolf Dini-ay on 07/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import Foundation

struct RealmMigrationKey {
    let rawValue: String
    let previousRawValue: String
    
    init(rawValue: String, previousRawValue: String) {
        self.rawValue = rawValue
        self.previousRawValue = previousRawValue
    }
    
}
