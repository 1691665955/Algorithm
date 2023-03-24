//
//  MZZigZagConversionVC.swift
//  Algorithm
//
//  Created by 曾龙 on 2019/12/2.
//  Copyright © 2019 com.mz. All rights reserved.
//

import UIKit
import MarkdownView

class MZZigZagConversionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white;
        self.title = "Z字型变换";
        
        let path = Bundle.main.path(forResource: "MZZigZagConversion", ofType: "txt");
        do  {
            let markDown = try NSString.init(contentsOfFile: path!, encoding: String.Encoding.utf8.rawValue)
            let md = MarkdownView();
            md.frame = self.view.bounds;
            md.load(markdown: markDown as String)
            self.view.addSubview(md);
        } catch {
            print("load markdown file failure!!!");
        }
        
        let substring = convert("LEETCODEISHIRING", 3);
        print("substring=",substring);
    }
    
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {
            return s;
        }
        var zString = String.init();
        for i in 0..<numRows {
            var j = i;
            while j < s.count {
                if i == 0 || i == numRows-1 {
                    zString.append(s[s.index(s.startIndex, offsetBy: j)]);
                    j = j+2*(numRows-1);
                } else {
                    zString.append(s[s.index(s.startIndex, offsetBy: j)]);
                    j = j+2*(numRows-i-1);
                    if j < s.count {
                        zString.append(s[s.index(s.startIndex, offsetBy: j)]);
                    }
                    j = j+2*i;
                }
            }
        }
        return zString;
    }

}
