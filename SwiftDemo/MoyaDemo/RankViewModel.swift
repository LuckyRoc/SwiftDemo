//
//  MoyaViewModel.swift
//  SwiftWeexSample
//
//  Created by chengruipeng on 2017/7/3.
//  Copyright © 2017年 com.taobao.weex. All rights reserved.
//

import UIKit
import RxSwift

class RankViewModel: NSObject {
    
    let disposeBag = DisposeBag()
        
    func getRank() -> Observable<RankModel> {
        return appServiceProvider.request(.GetRank("CN"))
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .showAPIErrorToast()
            .mapObject(type: RankModel.self)
    }
    
}
