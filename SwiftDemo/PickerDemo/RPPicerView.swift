//
//  RPPicerView.swift
//  SwiftDemo
//
//  Created by 程瑞朋 on 2017/7/26.
//  Copyright © 2017年 qbzn. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public class RPPicerView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {

    private let pickerViewHeight: CGFloat = 240.0
    private let buttonHeight: CGFloat = 44.0
    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height
    private var selectedIndex = 0
    private var dataArray = [String]()
    let disposeBag = DisposeBag()
    private lazy var backView = { () -> UIView in
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    private lazy var cancelButton = { () -> UIButton in
        let button = UIButton()
        button.setTitle("取消", for: .normal)
        button.setTitleColor(UIColor.RGB(red: 246, green: 135, blue: 67), for: .normal)
        return button
    }()
    private lazy var doneButton = { () -> UIButton in
        let button = UIButton()
        button.setTitle("完成", for: .normal)
        button.setTitleColor(UIColor.RGB(red: 246, green: 135, blue: 67), for: .normal)
        return button
    }()
    lazy var pickerView = { () -> UIPickerView in
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()
    lazy var datePickerView = { () -> UIDatePicker in
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        return datePickerView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        let window = UIApplication.shared.keyWindow
        guard let currentWindow = window else { return }
        currentWindow.addSubview(self)
        self.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(currentWindow)
        }
        self.backgroundColor = UIColor.clear
        self.addSubview(backView)
        backView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalTo(self)
            make.height.equalTo(0)
        }
        backView.addSubview(cancelButton)
        cancelButton.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.width.equalTo(60)
            make.top.equalTo(self.backView)
            make.height.equalTo(buttonHeight)
        }
        backView.addSubview(doneButton)
        doneButton.snp.makeConstraints { (make) in
            make.right.equalTo(-20)
            make.width.equalTo(60)
            make.top.equalTo(self.backView)
            make.height.equalTo(buttonHeight)
        }
        cancelButton.rx.tap.subscribe(onNext: {[weak self] in
            self?.hidePicker()
        }).disposed(by: disposeBag)
        doneButton.rx.tap.subscribe(onNext: {[weak self] in
            self?.hidePicker()
        }).disposed(by: disposeBag)
        // 点击背景移除self
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapAction(tap:)))
        addGestureRecognizer(tap)
    }
    convenience init(frame: CGRect, singleColData: [String], defaultSelectedIndex: Int?) {
        self.init(frame: frame)
        backView.addSubview(pickerView)
        pickerView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.height.equalTo(pickerViewHeight)
            make.top.equalTo(self.doneButton.snp.bottom)
        }
        self.dataArray = singleColData
        self.pickerView.reloadComponent(0)
        self.selectedIndex = defaultSelectedIndex!
    }
    convenience init(frame: CGRect, date: Bool) {
        self.init(frame: frame)
        backView.addSubview(datePickerView)
        datePickerView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.height.equalTo(pickerViewHeight)
            make.top.equalTo(self.doneButton.snp.bottom)
        }
        self.layoutIfNeeded()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        print("\(self.debugDescription) --- 销毁")
    }
    func tapAction(tap: UITapGestureRecognizer) {
        let location = tap.location(in: self)
        if location.y <= screenHeight - pickerViewHeight - buttonHeight {
            self.hidePicker()
        }
    }
    func showPicker() {
        UIView.animate(withDuration: 0.25, animations: {
            self.backView.snp.updateConstraints { (make) in
                make.bottom.left.right.equalTo(self)
                make.height.equalTo(self.pickerViewHeight + self.buttonHeight)
            }
            self.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.1)
            self.layoutIfNeeded()
        }) {[unowned self] (_) in
            self.pickerView.selectRow(self.selectedIndex, inComponent: 0, animated: true)
        }
    }
    func hidePicker() {
        UIView.animate(withDuration: 0.25, animations: { () -> Void in
            self.backView.snp.updateConstraints { (make) in
                make.bottom.left.right.equalTo(self)
                make.height.equalTo(0)
            }
            self.backgroundColor = UIColor.clear
            self.layoutIfNeeded()
        }) {[unowned self] (_) in
            self.removeFromSuperview()
        }
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.dataArray.count
    }
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.dataArray[row]
    }
}
