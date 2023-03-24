//
//  MZTwoNumsSumVC.swift
//  Algorithm
//
//  Created by 曾龙 on 2019/11/27.
//  Copyright © 2019 com.mz. All rights reserved.
//

import UIKit
import MarkdownView

class MZTwoNumsSumVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white;
        self.title = "两数之和";
        
        let path = Bundle.main.path(forResource: "MZTwoNumsSum", ofType: "txt");
        do  {
            let markDown = try NSString.init(contentsOfFile: path!, encoding: String.Encoding.utf8.rawValue)
            let md = MarkdownView();
            md.frame = self.view.bounds;
            md.load(markdown: markDown as String)
            self.view.addSubview(md);
        } catch {
            print("load markdown file failure!!!");
        }
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0 ..< (nums.count-1) {
            let num1 = nums[i]
            for j in (i+1) ..< nums.count {
                let num2 = nums[j];
                if (num1 + num2 == target) {
                    return [i, j];
                }
            }
        }
        return [];
    }
    
}
