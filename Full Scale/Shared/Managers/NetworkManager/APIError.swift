//
//  APIError.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 28/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import Foundation

struct APIError: Error, Decodable {
    let message: String
}
