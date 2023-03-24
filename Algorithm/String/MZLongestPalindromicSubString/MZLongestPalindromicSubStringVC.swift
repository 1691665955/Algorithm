//
//  MZLongestPalindromicSubStringVC.swift
//  Algorithm
//
//  Created by 曾龙 on 2019/11/29.
//  Copyright © 2019 com.mz. All rights reserved.
//

import UIKit
import MarkdownView

class MZLongestPalindromicSubStringVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white;
        self.title = "最长回文子串";
        
        let path = Bundle.main.path(forResource: "MZLongestPalindromicSubString", ofType: "txt");
        do  {
            let markDown = try NSString.init(contentsOfFile: path!, encoding: String.Encoding.utf8.rawValue)
            let md = MarkdownView();
            md.frame = self.view.bounds;
            md.load(markdown: markDown as String)
            self.view.addSubview(md);
        } catch {
            print("load markdown file failure!!!");
        }
        
        let substring = longestPalindrome("civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth");
        print("substring=",substring);
    }
    
    func longestPalindrome(_ s: String) -> String {
        var newS = String.init("#");
        for ch in s {
            newS.append(ch);
            newS.append("#");
        }
        newS.append("#");
        var maxR = 0;
        var mid = 0;
        var p = Array.init(repeating: 1, count: newS.count);
        
        for i in 0..<newS.count {
            if i < maxR {
                p[i] = min(maxR-i, p[mid*2-i]);
            }
            while i-p[i] >= 0 && i+p[i] < newS.count && newS[newS.index(newS.startIndex, offsetBy: i-p[i])] == newS[newS.index(newS.startIndex, offsetBy: i+p[i])] {
                p[i] = p[i] + 1;
            }
            if i+p[i] > maxR {
                maxR = i+p[i];
                mid = i;
            }
        }
        var maxP = p.max();
        let ans = p.firstIndex(of: maxP!);
        maxP = maxP! - 1;
        return newS[newS.index(newS.startIndex, offsetBy: ans!-maxP!)...newS.index(newS.startIndex, offsetBy: ans!+maxP!)].replacingOccurrences(of: "#", with: "");
    }
    
//    func longestPalindrome(_ s: String) -> String {
//        print("time:\(Date.init().timeIntervalSince1970)")
//        if s.count == 1 || s == String(s.reversed()) {
//            return s;
//        }
//        for i in 1..<s.count {
//            for j in 0..<i {
//                let startIndex = s.index(s.startIndex, offsetBy: j);
//                let endIndex = s.index(s.endIndex, offsetBy: -(i-j));
//                let substring = s[startIndex...endIndex];
//                if String(substring) == String(substring.reversed()) {
//                    print("i=\(i);j=\(j)");
//                    print("time:\(Date.init().timeIntervalSince1970)")
//                    return String(substring);
//                }
//            }
//        }
//        return String(s.suffix(1));
//    }
}
