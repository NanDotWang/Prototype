//
//  DataProvider.swift
//  Prototype
//
//  Created by Nan Wang on 2017-11-26.
//  Copyright © 2017 NanTech. All rights reserved.
//

import Foundation

struct DataProvider {

    static let demoProfiles = [
        Profile(name: "Nan", phone: "0723878112"),
        Profile(name: "Shangning", phone: "0760692938")
    ]

    private let profiles: [Profile]

    init(profiles: [Profile] = DataProvider.demoProfiles) {
        self.profiles = profiles
    }

    func numberOfRows(in section: Int) -> Int {
        return profiles.count
    }

    func object(at indexPath: IndexPath) -> Profile {
        return profiles[indexPath.row]
    }
}
