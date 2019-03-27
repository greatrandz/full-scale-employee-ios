//
//  Data+Extension.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 14/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import Foundation

extension Data {
    
    func decode<T: Decodable>() -> T? {
        let decoder = JSONDecoder()
        //decoder.dateDecodingStrategy = Data.dateDecodingStrategy
        return try? decoder.decode(T.self, from: self)
    }
    
    func printJSON() {
        guard let json = (try? JSONSerialization.jsonObject(with:
            self, options: [])) as? [String: Any] else {
                return
        }
        
        print(json)
    }
    
}

