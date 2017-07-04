//
//  HomeTableViewController.swift
//  SwiftWeexSample
//
//  Created by chengruipeng on 2017/6/30.
//  Copyright © 2017年 com.taobao.weex. All rights reserved.
//

import UIKit
import SnapKit

class HomeTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView?
    let identifier = "cell"
    var titltArray = ["网络请求","TableView"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        setUpTable()
    }

    func setUpTable() {
        tableView = UITableView()
        
        self.view.addSubview(tableView!)
        
        tableView!.backgroundColor = UIColor.white
        tableView!.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
        
        tableView!.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        tableView!.delegate = self
        tableView!.dataSource = self
    
        tableView?.tableFooterView = UIView()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifier)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.firstTitle?.text = titltArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titltArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let moya = MoyaViewController()
            self.navigationController?.pushViewController(moya, animated: true)
        default:
            let moya = MoyaViewController()
            self.navigationController?.pushViewController(moya, animated: true)
        }
    }
    
    
}
