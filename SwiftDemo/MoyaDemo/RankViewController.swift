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
import ObjectMapper

class MoyaViewController: UIViewController {
    
    let viewModel  = RankViewModel()
    let disposeBag = DisposeBag()
    
    let provider = RxMoyaProvider<ApiService>()
    
    var moyaView = RankView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "网络请求示例"
        self.view.addSubview(moyaView)
        
        moyaView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
        
        viewModel.getRank().subscribe(onNext: { (rankModel) in
            
            self.moyaView.label.text = "票房第一 :" + rankModel.reason!
            
        }).addDisposableTo(disposeBag)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
 

}
