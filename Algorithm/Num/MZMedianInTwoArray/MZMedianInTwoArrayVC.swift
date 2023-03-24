//
//  MZMedianInTwoArrayVC.swift
//  Algorithm
//
//  Created by 曾龙 on 2019/11/29.
//  Copyright © 2019 com.mz. All rights reserved.
//

import UIKit
import MarkdownView

class MZMedianInTwoArrayVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white;
        self.title = "寻找两个有序数组的中位数";
        
        let path = Bundle.main.path(forResource: "MZMedianInTwoArray", ofType: "txt");
        do  {
            let markDown = try NSString.init(contentsOfFile: path!, encoding: String.Encoding.utf8.rawValue)
            let md = MarkdownView();
            md.frame = self.view.bounds;
            md.load(markdown: markDown as String)
            self.view.addSubview(md);
        } catch {
            print("load markdown file failure!!!");
        }
        
        let nums1 = [1,3,4];
        let nums2 = [3,5,7];
        let result = findMedianSortedArrays(nums1, nums2);
        print("result=",result);
    }
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var nums = Array<Int>.init();
        nums.append(contentsOf: nums1);
        nums.append(contentsOf: nums2);
        nums.sort();
        if nums.count % 2 == 0 {
            return Double((nums[nums.count/2-1]+nums[nums.count/2]))/2;
        }
        return Double(nums[nums.count/2]);
    }

}
