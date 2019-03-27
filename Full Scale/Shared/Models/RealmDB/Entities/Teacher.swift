//
//  Teacher.swift
//  TestRealm
//
//  Created by Randolf Dini-ay on 06/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import RealmSwift

final class Teacher: Object, Decodable {
    //@objc private(set) dynamic var id = ""
    @objc private(set) dynamic var id = ""
    @objc private(set) dynamic var name = ""
    @objc private(set) dynamic var age = 0
    @objc private(set) dynamic var address = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case age
        case address
    }

    required convenience init(from decoder: Decoder) throws {
        self.init()
        //try container.decodeIfPresent(Student.self, forKey: .student)
        //try container.decodeIfPresent([Student].self,forKey: .students) ?? []
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.age = try container.decodeIfPresent(Int.self, forKey: .age) ?? 0
        self.address = try container.decodeIfPresent(String.self, forKey: .address) ?? ""
    }
    
}

extension Teacher: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Teacher.init()
        
        copy.id = id
        copy.name = name
        copy.age = age
        copy.address = address
        return copy
    }
}
