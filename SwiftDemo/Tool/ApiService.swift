//
//  GitHub.swift
//  SwiftWeexSample
//
//  Created by chengruipeng on 2017/6/29.
//  Copyright © 2017年 com.taobao.weex. All rights reserved.
//

import UIKit
import Moya

// 添加 Header
let headerFields: Dictionary<String, String> = [
    "platform": "iOS",
    "systemVersion": String(UIDevice.version())
]

let endpointClosure = { (target: ApiService) -> Endpoint<ApiService> in
    
    let stringURL = target.baseURL.appendingPathComponent(target.path).absoluteString
    
    return Endpoint<ApiService>(url: stringURL, sampleResponseClosure: {.networkResponse(200, target.sampleData)}, method: target.method, parameters: target.parameters)
        .adding(newHTTPHeaderFields: headerFields)
}

let apiProvider = RxMoyaProvider<ApiService>(endpointClosure: endpointClosure)

public enum ApiService {
    case GetRank(String)
}

extension ApiService: TargetType {
    
    public var baseURL: URL { return URL(string: "http://api.avatardata.cn")! }
    
    public var path: String {
        switch self {
        case .GetRank(_):
            return "/BoxOffice/Newest"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var parameters: [String: Any]? {
        switch self {
        case .GetRank(let area):
            return [
                "area": area,
                "key": "1eac0aca4d7e46618d04f93fad707ece"
            ]
        }
    }
    
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    public var task: Task {
        return .request
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    
}


private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}
