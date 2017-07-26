//
//  RPPicerView.swift
//  SwiftDemo
//
//  Created by 程瑞朋 on 2017/7/26.
//  Copyright © 2017年 矽岸. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public class RPPicerView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {

    private let pickerViewHeight: CGFloat = 260.0
    private let buttonHeight: CGFloat = 44.0
    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height
    private var selectedIndex = 0
    private var dataArray = [String]()
    let disposeBag = DisposeBag()
    private lazy var backView = { () -> UIView in
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    private lazy var cancelButton = { () -> UIButton in
        let button = UIButton()
        button.setTitle("取消", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        return button
    }()
    private lazy var doneButton = { () -> UIButton in
        let button = UIButton()
        button.setTitle("完成", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        return button
    }()
    lazy var pickerView = { () -> UIPickerView in
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(backView)
        backView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalTo(self)
            make.height.equalTo(0)
        }
        backView.addSubview(cancelButton)
        cancelButton.snp.makeConstraints { (make) in
            make.left.equalTo(backView)
            make.width.equalTo(60)
            make.top.equalTo(self.backView)
            make.height.equalTo(buttonHeight)
        }
        backView.addSubview(doneButton)
        doneButton.snp.makeConstraints { (make) in
            make.right.equalTo(self)
            make.width.equalTo(60)
            make.top.equalTo(self.backView)
            make.height.equalTo(buttonHeight)
        }
        backView.addSubview(pickerView)
        pickerView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.height.equalTo(pickerViewHeight)
            make.top.equalTo(self.doneButton.snp.bottom)
        }
        cancelButton.rx.tap.subscribe(onNext: {[weak self] in
            self?.hidePicker()
        }).disposed(by: disposeBag)
        doneButton.rx.tap.subscribe(onNext: {[weak self] in
            self?.hidePicker()
        }).disposed(by: disposeBag)
    }
    convenience init(frame: CGRect, singleColData: [String], defaultSelectedIndex: Int?) {
        self.init(frame: frame)
        self.dataArray = singleColData
        self.pickerView.reloadComponent(0)
        self.selectedIndex = defaultSelectedIndex!
        self.showPicker()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        print("\(self.debugDescription) --- 销毁")
    }
    func tapAction(tap: UITapGestureRecognizer) {
        let location = tap.location(in: self)
        if location.y <= screenHeight - pickerViewHeight {
            self.hidePicker()
        }
    }
    private func showPicker() {
        backView.snp.updateConstraints { (make) in
            make.bottom.left.right.equalTo(self)
            make.height.equalTo(self.pickerViewHeight + self.buttonHeight)
        }
        self.needsUpdateConstraints()
        self.updateConstraintsIfNeeded()
        UIView.animate(withDuration: 0.25, animations: {
            self.layoutIfNeeded()
        }) {[unowned self] (_) in
            self.pickerView.selectRow(self.selectedIndex, inComponent: 0, animated: true)
        }
    }
    func hidePicker() {
        backView.snp.updateConstraints { (make) in
            make.bottom.left.right.equalTo(self)
            make.height.equalTo(0)
        }
        self.needsUpdateConstraints()
        self.updateConstraintsIfNeeded()
        UIView.animate(withDuration: 0.25, animations: { () -> Void in
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
