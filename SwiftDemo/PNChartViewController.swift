//
//  PNChartViewController.swift
//  SwiftDemo
//
//  Created by 程瑞朋 on 2017/7/4.
//  Copyright © 2017年 矽岸. All rights reserved.
//

import UIKit

class PNChartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "PNChat-Swift"
        self.view.backgroundColor = UIColor.white
        
        let barChart = PNBarChart(frame: CGRect(x: 0.0, y: 95.0, width: 320.0, height: 200.0))
        
        barChart.backgroundColor = UIColor.clear
        barChart.animationType = .Waterfall
        barChart.labelMarginTop = 5.0
        barChart.xLabels = ["Sep 1", "Sep 2", "Sep 3", "Sep 4", "Sep 5", "Sep 6", "Sep 7"]
        barChart.yValues = [1, 23, 12, 18, 30, 12, 21]
        barChart.strokeChart()
        barChart.center = self.view.center
        
        self.view.addSubview(barChart)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    


}
