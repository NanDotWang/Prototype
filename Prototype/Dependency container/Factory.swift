//
//  Factory.swift
//  Prototype
//
//  Created by Nan Wang on 2017-11-26.
//  Copyright © 2017 NanTech. All rights reserved.
//

import Foundation
import NetworkingKit

protocol APIServiceFactory {
    func makeAPIService() -> APIService
}
