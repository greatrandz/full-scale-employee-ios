//
//  Session+Migration.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 27/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

extension Session.CodingKeys {
    
    // MARK - READ BEFORE YOU MAKE CHANGES. THIS IS USED FOR MIGRATION PURPOSES
    // Return the value of PREVIOUS PROPERTY you renamed, before changing it
    // Return the value of an EMPTY, if it's new added or the app is released to the AppStore
    // for example:
    // renamedProperty -> case .name:
    // oldProperty:    ->      return "fullname"
    
    var previousRawValue: String {
        switch self {
        case .token_type:
            return ""
        case .access_token:
            return ""
        case .refresh_token:
            return ""
        }
    }
    
    var isEdited: Bool {
        return !previousRawValue.isEmpty &&
            rawValue != previousRawValue
    }
    
}

extension Session {
    static func migrationKeys() -> [RealmMigrationKey] {
        let keys = Student.CodingKeys.allCases.filter({ $0.isEdited }).map { (key) -> RealmMigrationKey in
            let migrationKey = RealmMigrationKey(rawValue: key.rawValue, previousRawValue: key.previousRawValue)
            return migrationKey
        }
        return keys
    }
}
