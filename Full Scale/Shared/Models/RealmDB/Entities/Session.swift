//
//  Session.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 27/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import RealmSwift

final class Session: Object, Decodable {
    @objc dynamic var id  = sessionId
    @objc dynamic var token_type = ""
    @objc dynamic var access_token = ""
    @objc dynamic var refresh_token = ""
    
    enum CodingKeys: String, CodingKey {
        case token_type
        case access_token
        case refresh_token
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        token_type = try container.decode(String.self, forKey: .token_type)
        access_token = try container.decode(String.self, forKey: .access_token)
        refresh_token = try container.decode(String.self, forKey: .refresh_token)
    }
    
}

extension Session {
    static let sessionId = String(describing: Session.self)
    static var current: Session? {
        return RealmManager().fetch(for: sessionId)
    }
}
