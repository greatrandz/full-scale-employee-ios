//
//  RealmManager.swift
//  TestRealm
//
//  Created by Randolf Dini-ay on 05/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import RealmSwift

typealias ReamMigrationCompletion = () -> Void

final class RealmManager {
    
    static func setConfiguration(migrateCompletion: ReamMigrationCompletion? = nil) {

        let realMigration = RealmMigration()
        do {
            let config = Realm.Configuration(schemaVersion: realMigration.currentSchemaVersion)
            _ = try Realm(configuration: config)
        } catch {
            let config = Realm.Configuration(schemaVersion: realMigration.newSchemaVersion,
                                             migrationBlock: realMigration.migrateCompletion(migrateCompletion))
            Realm.Configuration.defaultConfiguration = config
        }
    }
    
    private lazy var realm: Realm = {
        var realm: Realm!
        do {
            realm = try Realm()
        } catch let error as NSError {
            // handle error
            print("error: \(error)")
        }
        
        return realm
    }()
    
    func execute(_ closure: (Realm) -> Void) {
        try? realm.write {
            closure(realm)
        }
    }
    
    func add(object: Object) {
        execute { $0.add(object) }
    }
    
    func add(objects: [Object]) {
        execute { $0.add(objects) }
    }
    
    func update(object: Object) {
        execute { $0.add(object, update: true) }
    }
    
    func update(objects: [Object]) {
        execute { $0.add(objects, update: true) }
    }
    
    func remove(object: Object) {
        execute { $0.delete(object) }
    }
    
    func removeAll() {
        execute { $0.deleteAll() }
    }
    
    func fetch<T: Object>(_ type: T.Type) -> Results<T> {
        return realm.objects(type)
    }
    
    func fetch<T: Object, KeyType>(for primaryKey: KeyType) -> T? {
        return realm.object(ofType: T.self, forPrimaryKey: primaryKey)
    }
}
