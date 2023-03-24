//
//  MZThreeNumsSumVC.swift
//  Algorithm
//
//  Created by 曾龙 on 2019/12/27.
//  Copyright © 2019 com.mz. All rights reserved.
//

import UIKit
import MarkdownView

class MZThreeNumsSumVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white;
        self.title = "三数之和";
        
        let path = Bundle.main.path(forResource: "MZThreeNumsSum", ofType: "txt");
        do  {
            let markDown = try NSString.init(contentsOfFile: path!, encoding: String.Encoding.utf8.rawValue)
            let md = MarkdownView();
            md.frame = self.view.bounds;
            md.load(markdown: markDown as String)
            self.view.addSubview(md);
        } catch {
            print("load markdown file failure!!!");
        }
        
        print(threeSum1([-1,0,1,2,-1,-4,0,-4,83,392,-272,-39,4,4,4,-1,0,-44,78,99,2]));
    }
    
    func threeSum1(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return [];
        }
        var result = Array<[Int]>.init();
        let sortNums = nums.sorted();
        for index in 0..<sortNums.count {
            if sortNums[index] > 0 {
                break;
            }
            if index > 0 && sortNums[index] == sortNums[index-1] {
                continue;
            }
            var i = index+1;
            var j = sortNums.count-1;
            while (i < j) {
                let sum = sortNums[index] + sortNums[i] + sortNums[j];
                if sum == 0 {
                    result.append([sortNums[index],sortNums[i],sortNums[j]]);
                    while sortNums[i] == sortNums[i+1] {
                        i = i + 1;
                    }
                    while sortNums[j] == sortNums[j-1] {
                        j = j - 1;
                    }
                    i = i + 1;
                    j = j - 1;
                }  else if (sum < 0) {
                    i = i + 1;
                } else {
                    j = j - 1;
                }
            }
        }
        return result;
    }

    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return [];
        }
        var result = Array<[Int]>.init();
        
        var nums1 = Array<Int>.init();//负数数组
        var nums2 = Array<Int>.init();//零数组
        var nums3 = Array<Int>.init();//正数数组
        for item in nums {
            if item < 0 {
                if nums1.firstIndex(of: item) != nil {
                    if nums.contains(-2*item) {
                        if !result.contains([item, item, -2*item]) {
                            result.append([item, item, -2*item]);
                        }
                    }
                } else {
                    nums1.append(item);
                }
            } else if item == 0 {
                nums2.append(item);
            } else {
                if nums3.firstIndex(of: item) != nil {
                    if nums.contains(-2*item) {
                        if !result.contains([-2*item, item, item]) {
                            result.append([-2*item, item, item]);
                        }
                    }
                } else {
                    nums3.append(item);
                }
            }
        }
        
        nums1 = nums1.sorted();
        nums2 = nums2.sorted();
        nums2 = nums2.sorted();
        
        let numss = dealWithNums(nums: [nums1,nums3]);
        nums1 = numss[0];
        nums3 = numss[1];
        if nums1.count == 0 || nums3.count == 0  {
            if nums2.count >= 3 {
                return [[0, 0, 0]];
            }
            return [];
        }
        if nums2.count > 0 {
            if nums2.count >= 3 {
                result.append([0, 0, 0]);
            }
            var currentNum = 0;
            for item in nums1 {
                if item == currentNum {
                    continue;
                } else {
                    if nums3.contains(-item) {
                        result.append([item,0,-item]);
                        currentNum = item;
                    }
                }
            }
        }
        if nums1.count > 1 {
            for i in 0..<nums1.count-1 {
                let num1 = nums1[i];
                for j in i+1..<nums1.count {
                    let num2 = nums1[j];
                    if nums3.contains(-(num1+num2)) {
                        result.append([num1, num2, -(num1+num2)]);
                    }
                }
            }
        }
        if nums3.count > 1 {
            for i in 0..<nums3.count-1 {
                let num1 = nums3[i];
                for j in i+1..<nums3.count {
                    let num2 = nums3[j];
                    if nums1.contains(-(num1+num2)) {
                        result.append([-(num1+num2), num1, num2]);
                    }
                }
            }
        }
        return result;
    }
    
    func dealWithNums(nums:[[Int]]) -> [[Int]] {
        var nums1 = nums[0];
        var nums3 = nums[1];
        if nums1.count > 0 {
            let item11 = nums1[0];
            if nums3.count > 1 {
                let item31 = nums3[nums3.count-2];
                let item32 = nums3[nums3.count-1];
                if -item11 > item31+item32  {
                    nums1.remove(at: 0);
                    return dealWithNums(nums: [nums1,nums3]);
                }
            } else if nums3.count == 1 {
                if nums1.count > 1 {
                    let item12 = nums1[1];
                    let item31 = nums3[0];
                    if -(item11+item12) < item31  {
                        nums3.remove(at: 0);
                        return dealWithNums(nums: [nums1,nums3]);
                    }
                }
            } else {
                return [[],[]];
            }
        } else {
            return [[],[]];
        }
        return nums;
    }
}
