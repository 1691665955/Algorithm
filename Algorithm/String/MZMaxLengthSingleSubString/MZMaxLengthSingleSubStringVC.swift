//
//  MZMaxLengthSingleSubStringVC.swift
//  Algorithm
//
//  Created by 曾龙 on 2019/11/28.
//  Copyright © 2019 com.mz. All rights reserved.
//

import UIKit
import MarkdownView

class MZMaxLengthSingleSubStringVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white;
        self.title = "无重复字符的最长子串";
        
        let path = Bundle.main.path(forResource: "MZMaxLengthSingleSubString", ofType: "txt");
        do  {
            let markDown = try NSString.init(contentsOfFile: path!, encoding: String.Encoding.utf8.rawValue)
            let md = MarkdownView();
            md.frame = self.view.bounds;
            md.load(markdown: markDown as String)
            self.view.addSubview(md);
        } catch {
            print("load markdown file failure!!!");
        }
        
        let length = lengthOfLongestSubstring("abcabcbfwfefdffrrbggnnhnsdghjhtrrb");
        print("length=%ld",length);
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLength = 0;
        var array = Array<Character>.init();
        for ch in s {
            if array.contains(ch) {
                if maxLength < array.count {
                    maxLength = array.count;
                }
                let index = array.firstIndex(of: ch);
                array.removeSubrange(Range.init(NSRange.init(location: 0, length: index!+1))!);
            }
            array.append(ch);
        }
        if maxLength < array.count {
            maxLength = array.count;
        }
        return maxLength;
    }
    
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        var maxLength = 0;
//        var array = Array<String>.init();
//        for i in 0..<s.count {
//            if s.count-i < maxLength {
//                return maxLength;
//            }
//            array.removeAll();
//            array.append(s[s.index(s.startIndex, offsetBy: i)].description);
//            for j in i+1..<s.count {
//                let ch = s[s.index(s.startIndex, offsetBy: j)].description;
//                if array.contains(ch) {
//                    break;
//                } else {
//                    array.append(ch);
//                }
//            }
//            if maxLength < array.count {
//                maxLength = array.count;
//            }
//        }
//        return maxLength;
//    }
    
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        var maxLength = 0;
//        var subString = "";
//        for i in 0..<s.count {
//            if s.count-i < maxLength {
//                return maxLength;
//            }
//            subString = String(s[s.index(s.startIndex, offsetBy: i)...s.index(s.startIndex, offsetBy: i)]);
//            for j in i+1..<s.count {
//                let ch = String(s[s.index(s.startIndex, offsetBy: j)...s.index(s.startIndex, offsetBy: j)]);
//                if subString.contains(ch) {
//                    break;
//                } else {
//                    subString = String(s[s.index(s.startIndex, offsetBy: i)...s.index(s.startIndex, offsetBy: j)])
//                }
//            }
//            if maxLength < subString.count {
//                maxLength = subString.count;
//            }
//        }
//        return maxLength;
//    }

}
