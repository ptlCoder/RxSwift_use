//
//  ViewController.swift
//  RxSwift常见用法
//
//  Created by soliloquy on 2017/12/27.
//  Copyright © 2017年 soliloquy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    fileprivate lazy var dataSource:Array = ["RxSwift初体验", "RxSwift常见操作", "RxSwift中Subjects使用", "RxSwift的变换操作", "RxSwift资源释放", "RxSwift的UITableVIew使用"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "RxSwift简单用法"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc : UIViewController? = nil
        if indexPath.row == 0 {
            vc = ViewController1()
        }else if indexPath.row == 1 {
            vc = ViewController2()
        }else if indexPath.row == 2 {
            vc = ViewController3()
        }else if indexPath.row == 3 {
            vc = ViewController4()
        }else if indexPath.row == 4 {
            
        }
        navigationController?.pushViewController(vc!, animated: true)
    }
}
