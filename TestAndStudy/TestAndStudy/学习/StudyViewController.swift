//
//  StudyViewController.swift
//  TestAndStudy
//
//  Created by 曹国盛 on 2022/7/5.
//

import Foundation
import UIKit



class StudyViewController:UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var tableView:UITableView?
    var nameArray:Array<String>?
    
    
    override func viewDidLoad() {
        
        nameArray = ["Atomic与Nonatomic"]
        
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
        if(str == "Atomic与Nonatomic"){
            let vc = AtomocAndNonatomicVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
