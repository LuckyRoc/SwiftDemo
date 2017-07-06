//
//  DefaultAlamofireManager.swift
//  SwiftDemo
//
//  Created by 程瑞朋 on 2017/7/4.
//  Copyright © 2017年 矽岸. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class DefaultAlamofireManager: Alamofire.SessionManager {
    static let sharedManager: DefaultAlamofireManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 3
        configuration.timeoutIntervalForResource = 3
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return DefaultAlamofireManager(configuration: configuration)
    }()
}
