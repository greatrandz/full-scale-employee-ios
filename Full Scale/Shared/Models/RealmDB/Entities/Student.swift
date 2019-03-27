//
//  Student.swift
//  TestRealm
//
//  Created by Randolf Dini-ay on 05/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import RealmSwift

final class Student: Object, Decodable {
    //@objc private(set) dynamic var id = ""
    @objc private(set) dynamic var id = ""
    @objc private(set) dynamic var name = ""
    @objc private(set) dynamic var age = 0
    @objc private(set) dynamic var address = ""
    @objc private(set) dynamic var country = ""
    @objc private(set) dynamic var course = ""
    @objc private(set) dynamic var teacher: Teacher?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case age
        case address
        case country
        case course
        case teacher
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
        self.country = try container.decodeIfPresent(String.self, forKey: .country) ?? ""
        self.course = try container.decodeIfPresent(String.self, forKey: .course) ?? ""
        self.teacher = try container.decodeIfPresent(Teacher.self, forKey: .teacher) 
    }
    
}

extension Student: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Student.init()
        
        copy.id = id
        copy.name = name
        copy.age = age
        copy.address = address
        copy.country = country
        copy.course = course
        
        return copy
    }
}
