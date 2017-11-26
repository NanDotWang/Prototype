//
//  APIResources.swift
//  Prototype
//
//  Created by Nan Wang on 2017-11-26.
//  Copyright © 2017 NanTech. All rights reserved.
//

import Foundation

struct Profile {
    let name: String
    let phone: String
}

extension Profile {
    init?(dictionary: [String: Any]) {
        guard
            let name = dictionary["name"] as? String,
            let phone = dictionary["phone"] as? String
            else { return nil }

        self.name = name
        self.phone = phone
    }
}
