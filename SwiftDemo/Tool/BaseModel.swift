//
//  BaseModel.swift
//  SwiftDemo
//
//  Created by 程瑞朋 on 2017/7/4.
//  Copyright © 2017年 矽岸. All rights reserved.
//

import UIKit
import ObjectMapper

class BaseModel: Mappable {
    
    var error_code: Int?
    var reason: String?
    var result: RankModel?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        error_code <- map["error_code"]
        reason <- map["reason"]
        result <- map["result"]
    }
    
}
