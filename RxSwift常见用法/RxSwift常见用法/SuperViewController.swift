//
//  SuperViewController.swift
//  RxSwift常见用法
//
//  Created by soliloquy on 2017/12/27.
//  Copyright © 2017年 soliloquy. All rights reserved.
//

import UIKit

class SuperViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
//        view.backgroundColor = random()
    }

    func random() -> UIColor{
        return UIColor.init(red: CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1)
    }
    

}
