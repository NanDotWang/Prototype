//
//  DependencyContainer.swift
//  Prototype
//
//  Created by Nan Wang on 2017-11-26.
//  Copyright © 2017 NanTech. All rights reserved.
//

import NetworkingKit

class DependencyContainer {

    private lazy var apiService = APIService()
}

extension DependencyContainer: APIServiceFactory {
    func makeAPIService() -> APIService {
        return APIService()
    }
}
