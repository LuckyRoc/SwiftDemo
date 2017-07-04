//
//  showAPIErrorToast.swift
//  SwiftWeexSample
//
//  Created by chengruipeng on 2017/6/30.
//  Copyright © 2017年 com.taobao.weex. All rights reserved.
//

import Foundation
import RxSwift

extension Observable {
    func showAPIErrorToast() -> Observable<Element> {
        return self.do(onNext: { (event) in
        }, onError: { (error) in
            // TODO: 可以在此处做一些网络错误的时候的提示信息
            print("\(error.localizedDescription)")
        }, onCompleted: {
        }, onSubscribe: {
        }, onDispose: {
        })
    }
}
