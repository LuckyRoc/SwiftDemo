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
    
    var code: Int = 0  //基本数据类型要赋个初值
    var text: String?
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        code <- map["code"]
        text <- map["text"]
    }
}
