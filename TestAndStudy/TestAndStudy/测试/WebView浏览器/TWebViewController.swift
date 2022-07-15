//
//  TWebView.swift
//  TestAndStudy
//
//  Created by 曹国盛 on 2022/6/15.
//

import Foundation
import UIKit
import WebKit

class TWebViewController:BaseViewController,UITextFieldDelegate{
    
    var webView:WKWebView?
    var tf:UITextField?
    
    
    override func viewWillDisappear(_ animated: Bool) {
        tf!.removeFromSuperview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.addSubview(tf!)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.red
        
        tf = UITextField.init(frame: CGRect.init(x: 80, y: 0, width: kScreenWidth - 160, height: 40))
        tf?.placeholder = "请输入网址"
        tf?.backgroundColor = UIColor.yellow
        tf?.delegate = self
        
        let config = WKWebViewConfiguration.init()
        webView = WKWebView.init(frame: CGRect.init(x: 0, y: kStatusNavHeight, width: kScreenWidth, height: kScreenHeight - kStatusNavHeight), configuration: config)
        self.view .addSubview(webView!)
        webView!.load(URLRequest.init(url:(URL.init(string: "https://m.qqduu.com/qdq-17/1023111/52155099-2.html"))!))
    }
    
    
    override func backAction() {
        if (webView!.canGoBack){
            webView!.goBack();
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tf?.resignFirstResponder()
        var str = textField.text
        str = str?.lowercased()
        if((str!.hasPrefix("http"))){
            webView!.load(URLRequest.init(url:(URL.init(string: str!))!))
        }
        return true
    }
    
}
