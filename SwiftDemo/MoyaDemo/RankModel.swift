//
//  RankModel.swift
//  SwiftDemo
//
//  Created by chengruipeng on 2017/7/3.
//  Copyright © 2017年 矽岸. All rights reserved.
//

import UIKit
import ObjectMapper

class RankModel: Mappable {
    
    var error_code: Int?
    var reason: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        error_code <- map["error_code"]
        reason <- map["reason"]
    }
    
}
