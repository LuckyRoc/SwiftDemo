//
//  MoyaViewModel.swift
//  SwiftWeexSample
//
//  Created by chengruipeng on 2017/7/3.
//  Copyright © 2017年 com.taobao.weex. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import SwiftyJSON


class MoyaViewModel: NSObject {
    
    let disposeBag = DisposeBag()
    
    let apiProvider = MoyaProvider<ApiService>()
    

    /*
    struct cancelResult: Mappable {
        let status: String?
        
        init?(jsonData: JSON) {
            self.status = jsonData["status"].string
        }
    }
     
    */
    
    
    

}
