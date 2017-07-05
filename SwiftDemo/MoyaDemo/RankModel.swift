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
    var ranks: [Rank]?
    
    required init?(map: Map) {
    
    }
    
    func mapping(map: Map) {
        ranks <- map["result"]
    }
}

class Rank: Mappable {
    
    var rid: Int?
    var name: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        rid <- map["rid"]
        name <- map["name"]
    }
}
