//
//  TestViewController.swift
//  TestAndStudy
//
//  Created by 曹国盛 on 2022/6/15.
//

import Foundation
import UIKit


class TestViewController:UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var tableView:UITableView?
    var nameArray:Array<String>?
    
    
    override func viewDidLoad() {
        
        nameArray = ["WebView浏览器"]
        
        tableView = UITableView.init(frame:CGRect.init(x: 0, y: kStatusNavHeight, width:kScreenWidth , height: kScreenHeight - kStatusNavHeight) , style: UITableView.Style.plain)
        self.view.addSubview(tableView!)
        tableView!.delegate = self
        tableView!.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
        if((cell == nil)){
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        }
        cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        cell?.textLabel?.text = nameArray![indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray!.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let str = nameArray![indexPath.row]
        if(str == "WebView浏览器"){
            let webVC = TWebViewController()
            self.navigationController?.pushViewController(webVC, animated: true)
        }
    }
    
}
