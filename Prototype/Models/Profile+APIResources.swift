//
//  Profile+APIResources.swift
//  Prototype
//
//  Created by Nan Wang on 2017-11-26.
//  Copyright © 2017 NanTech. All rights reserved.
//

import Foundation
import NetworkingKit

/// API resources related to Profile - get current user profile
extension Profile {

    /// API resource to get current user's profile
    static let currentUser = APIResource(url: getProfileURL(), parseJSON: parseProfile)

    /// https://api.myjson.com/bins/p7p27
    static func getProfileURL() -> URL {
        var urlCompopnents = URLComponents()
        urlCompopnents.scheme = "https"
        urlCompopnents.host = "api.myjson.com"
        urlCompopnents.path = "/bins/p7p27"
        return urlCompopnents.url!
    }

    static func parseProfile(_ json: Any) -> Profile? {
        guard
            let jsonDictionary = json as? [String: Any],
            let profile = Profile(dictionary: jsonDictionary)
            else { return nil }

        return profile
    }
}

/// Get all users nearby
extension Profile {

    static let nearbyUsers = APIResource(url: getNearbyUsersURL(), parseJSON: parseNearbyUsers)

    static func getNearbyUsersURL() -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.myjson.com"
        urlComponents.path = "/bins/1anxzj"
        return urlComponents.url!
    }

    static func parseNearbyUsers(_ json: Any) -> [Profile]? {
        guard
            let jsonDictionary = json as? [String: Any],
            let usersArray = jsonDictionary["nearbyUsers"] as? [[String: Any]]
            else { return nil }

        return usersArray.flatMap { Profile(dictionary: $0) }
    }
}
