//
//  ViewController1.swift
//  RxSwift常见用法
//
//  Created by soliloquy on 2017/12/27.
//  Copyright © 2017年 soliloquy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController1: SuperViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    fileprivate lazy var bag: DisposeBag = DisposeBag()
    @IBOutlet weak var tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // FIXME: 控件要校验 否则后面的代码没有提示
        
        // 1、按钮
        guard let button1 = button1 else { //校验是为了后面有代码提示
            print("Error")
            return
        }
        button1.rx.tap.subscribe{ (even : Event<()>) in
            print("你点击了按钮")
            }.disposed(by: bag)
        // 2、输入框
//        tf.rx.text.subscribe { (even : Event<String?>) in
//            print(even.element!!)
//            self.label.text = even.element!
//            }.disposed(by: bag)
        
//        tf.rx.text.subscribe(onNext: { (str : String?) in
//            print("str: \(str ?? "")")
//            self.label.text = str ?? ""
//        }).disposed(by: bag)
        
        if let tf  = tf { // if校验为了后面有代码提示
            tf.rx.text.bind(to: label.rx.text).disposed(by: bag)
        }
        
        // 3、文本
        label.rx.observe(String.self, "text").subscribe(onNext: { (string) in
            print("s--\(string!)")
            /*
             2017-12-27 16:51:06.102420+0800 RxSwift常见用法[16431:2762994] [MC] Reading from private effective user settings.
             s--1
             s--11
             s--111
             s--1111
             s--11111
             */
        }).disposed(by: bag)
        
        // 4、UIScrollView
        scrollView.contentSize = CGSize(width: 1000, height: 1100)
        scrollView.rx.contentOffset.subscribe(onNext: { (poit) in
            
        print("poit== \(poit.x)")
        }).disposed(by: bag)
        
    }
}
