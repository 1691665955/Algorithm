//
//  MZTwoNumsAddVC.swift
//  Algorithm
//
//  Created by 曾龙 on 2019/11/28.
//  Copyright © 2019 com.mz. All rights reserved.
//

import UIKit
import MarkdownView

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class MZTwoNumsAddVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white;
        self.title = "两数相加";
        
        let path = Bundle.main.path(forResource: "MZTwoNumsAdd", ofType: "txt");
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
    

    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        return addTwoNumbersWithExpand(l1, l2, false);
    }
    
    func addTwoNumbersWithExpand(_ l1: ListNode?, _ l2: ListNode?, _ expand:Bool) -> ListNode? {
        if l1 == nil  {
            if l2 == nil {
                return expand ? ListNode.init(1) : nil;
            } else {
                if expand {
                    let list = ListNode.init((l2!.val+1)%10);
                    list.next = addTwoNumbersWithExpand(nil, l2?.next, (l2!.val+1)/10==1);
                    return list;
                } else {
                    return l2;
                }
            }
        }
        if l2 == nil {
            if expand {
                let list = ListNode.init((l1!.val+1)%10);
                list.next = addTwoNumbersWithExpand(l1?.next, nil, (l1!.val+1)/10==1);
                return list;
            } else {
                return l1;
            }
        }
        if expand {
            let list = ListNode.init((l1!.val+l2!.val+1)%10);
            list.next = addTwoNumbersWithExpand(l1?.next, l2?.next, ((l1!.val+l2!.val+1)/10==1));
            return list;
        } else {
            let list = ListNode.init((l1!.val+l2!.val)%10);
            list.next = addTwoNumbersWithExpand(l1?.next, l2?.next, ((l1!.val+l2!.val)/10==1));
            return list;
        }
    }

}
