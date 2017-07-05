//
//  MoyaViewModel.swift
//  SwiftDemo
//
//  Created by chengruipeng on 2017/7/3.
//  Copyright © 2017年 矽岸. All rights reserved.
//

import UIKit
import RxSwift

class RankViewModel: NSObject {
    
    let disposeBag = DisposeBag()
        
    func getRank() -> Observable<RankModel> {
        return apiServiceProvider.request(.GetRank("CN"))
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .showAPIErrorToast()
            .mapObject(type: RankModel.self)
    }
    
}
