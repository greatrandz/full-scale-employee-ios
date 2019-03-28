//
//  RealmMigration.swift
//  TestRealm
//
//  Created by Randolf Dini-ay on 07/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//
import RealmSwift

final class RealmMigration {
    
    private let schemaVersionKey = "SCHEMA-VERSION-KEY"
    
    init() {
        print("fileURL = \(String(describing: Realm.Configuration.defaultConfiguration.fileURL))")
    }
    
    var currentSchemaVersion: UInt64 {
        return (UserDefaults.standard.object(forKey: schemaVersionKey) as? UInt64 ?? 0)
    }
    
    var newSchemaVersion: UInt64 {
        return currentSchemaVersion + 1
    }
    
    func migrateCompletion(_ completion: ReamMigrationCompletion?) -> MigrationBlock? {
        let schemaVersionKey = self.schemaVersionKey
        let newSchemaVersion = self.newSchemaVersion
        
        let block: MigrationBlock = { migration, oldSchemaVersion in
            
            if oldSchemaVersion < newSchemaVersion {
                
                UserDefaults.standard.set(newSchemaVersion, forKey: schemaVersionKey)
                
                self.migration(migration, className: Student.className(), keys: Student.migrationKeys())
                self.migration(migration, className: Teacher.className(), keys: Teacher.migrationKeys())
                print("SUCCESSFULLY MIGRATED")
                completion?()
            }
        }
        return block
    }

    private func migration(_ migration: Migration, className: String, keys: [RealmMigrationKey]) {
        migration.enumerateObjects(ofType: className) { oldObject, newObject in
            for key in keys {
                newObject?[key.rawValue] = oldObject?[key.previousRawValue]
            }
        }
    }
    
}
