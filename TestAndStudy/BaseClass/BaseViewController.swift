//
//  BaseViewController.swift
//  TestAndStudy
//
//  Created by 曹国盛 on 2022/6/27.
//

import Foundation
import UIKit

class BaseViewController:UIViewController{
    
    
    deinit{
        let name: AnyClass! = object_getClass(self)
        let className = NSStringFromClass(name)
        print("\(className)->\(NSStringFromSelector(#function))")
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
        self.setupNavBackBtn()
    }
    
    //返回按钮
    func setupNavBackBtn(){
        if((self.navigationController?.viewControllers.count)! > 1){
            let backBtn = UIButton.init(type: UIButton.ButtonType.custom)
            backBtn.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40);
            backBtn.setImage(UIImage.init(named: "nav_back"), for: UIControl.State.normal)
            backBtn.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)
            let  item =  UIBarButtonItem.init(customView: backBtn)
            self.navigationItem.leftBarButtonItem = item;
        }
    }
    
    @objc func backAction(){
        self.navigationController?.popViewController(animated: true)
     }
}
