//
//  MoyaViewController.swift
//  SwiftWeexSample
//
//  Created by chengruipeng on 2017/6/30.
//  Copyright © 2017年 com.taobao.weex. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON
import SVProgressHUD
import RxSwift

class MoyaViewController: UIViewController {
    
    let viewModel  = MoyaViewModel()
    let disposeBag = DisposeBag()
    
    let provider = RxMoyaProvider<ApiService>()
    
    var moyaView = MoyaView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "网络请求示例"
        self.view.addSubview(moyaView)
        
        moyaView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
        /*
        provider.request(.GetRank("CN"))
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .mapArray(type: RankModel.self)
            .subscribe(onNext: { (posts: [RankModel]) in
                print(posts.count)
            })
            .addDisposableTo(disposeBag)
        
        provider.request(.GetRank("CN"))
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .subscribe(onNext: { (json) in
//                let json = JSON(data: json)
//                if let first = json["result"][0]["name"].string{
//                    self.moyaView.label.text = "票房第一 :" + first
//                }
                print(json)
            })
            .addDisposableTo(disposeBag)
        */
        
        SVProgressHUD.show(withStatus: "正在请求网络")
        
        apiProvider.request(.GetRank("CN")) { result in
            switch result {
            case let .success(response):
                SVProgressHUD.dismiss()
                
                let json = JSON(data: response.data)
                
                if let first = json["result"][0]["name"].string{
                    self.moyaView.label.text = "票房第一 :" + first
                }
                
            case .failure(_):
                
                SVProgressHUD.dismiss()
                
            }
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
 

}
