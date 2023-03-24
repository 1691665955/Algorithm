//
//  MZNumCategoryVC.swift
//  Algorithm
//
//  Created by 曾龙 on 2019/11/27.
//  Copyright © 2019 com.mz. All rights reserved.
//

import UIKit

class MZNumCategoryVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var tableview:UITableView!
    var dataSource:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white;
        self.title = "数字"
        
        self.dataSource = ["两数之和","两数相加","寻找两个有序数组的中位数","三数之和"];
        
        self.tableview = UITableView.init(frame: self.view.bounds);
        self.tableview.dataSource = self;
        self.tableview.delegate = self;
        self.tableview.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell");
        self.view.addSubview(self.tableview);
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell");
        cell?.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator;
        cell?.textLabel?.text = self.dataSource[indexPath.row] as? String;
        return cell!;
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(MZTwoNumsSumVC.init(), animated: true);
        case 1:
            self.navigationController?.pushViewController(MZTwoNumsAddVC.init(), animated: true);
        case 2:
            self.navigationController?.pushViewController(MZMedianInTwoArrayVC.init(), animated: true);
        case 3:
            self.navigationController?.pushViewController(MZThreeNumsSumVC.init(), animated: true);
        default:
            break;
        }
    }
    
}
