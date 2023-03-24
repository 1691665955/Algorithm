//
//  AppDelegate.swift
//  Algorithm
//
//  Created by 曾龙 on 2019/11/27.
//  Copyright © 2019 com.mz. All rights reserved.
//

import UIKit

protocol Vehicle {
    var numberOfWheels: Int {get}
    var color: UIColor {get set}
    
    mutating func changeColor()
}

struct MyCar: Vehicle {
    var numberOfWheels = 4
    var color = UIColor.blue
    
    mutating func changeColor() {
        color = UIColor.red
    }
}

struct Student {
    var name: String
    var age: Int
    var score: Int
    
//    init(name: String, age: Int, score: Int) {
//        self.name = name;
//        self.age = age;
//        self.score = score;
//    }
}

enum TDDeviceType {
    case Light
    case Fan
    case AirCondition
}

struct sun {
    var num1 = 100, num2 = 200
}

struct diff {
    var no1 = 200, no2 = 100
}

struct mult {
    var a = sun()
    var b = diff()
}


extension mult {
    init(x: sun, y: diff) {
        _ = x.num1 + x.num2
        _ = y.no1 + y.no2
    }
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var lock: NSLock!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window!.backgroundColor = .white;
        self.window?.makeKeyAndVisible();
        
        let nvc = UINavigationController.init(rootViewController: MZMainPageVC.init());
        self.window?.rootViewController = nvc;
        
        let statusBarHeight = application.statusBarFrame.size.height;
        let navHeight = nvc.navigationBar.frame.size.height;
        print("statusBarHeight:\(statusBarHeight)    navHeight:\(navHeight)");
        
        let array = [2,34,3,4,37,343,12,324,6,13,17];
        print(array);
        print(bubbleSort(array));
        print(selectionSort(array));
        print(insetionSort(array));
        print(mergeSort(array));
        print(quickSort(array));
        
        let node1 = ListNode.init(1);
        let node2 = ListNode.init(2);
        let node3 = ListNode.init(3);
        let node4 = ListNode.init(4);
        let node5 = ListNode.init(5);
        let node6 = ListNode.init(6);
        let node7 = ListNode.init(7);
        let node8 = ListNode.init(8);
        let node9 = ListNode.init(9);
        node1.next = node2;
        node2.next = node3;
        node3.next = node4;
        node4.next = node5;
        node5.next = node6;
        node6.next = node7;
        node7.next = node8;
        node8.next = node9;
        
//        let board = [
//            ['5','3',".",".","7",".",".",".","."],
//            ["6",".",".","1","9","5",".",".","."],
//            [".","9","8",".",".",".",".","6","."],
//            ["8",".",".",".","6",".",".",".","3"],
//            ["4",".",".","8",".","3",".",".","1"],
//            ["7",".",".",".","2",".",".",".","6"],
//            [".","6",".",".",".",".","2","8","."],
//            [".",".",".","4","1","9",".",".","5"],
//            [".",".",".",".","8",".",".","7","9"]
//        ];
//        print(isValidSudoku(board));
        
        let student = Student.init(name: "zz", age: 18, score: 93)
        print(student);
        
        
        let a = sun(num1: 100, num2: 200)
        let b = diff(no1: 200, no2: 100)

        let getMult = mult(x: a, y: b)
        print("getMult sun\(getMult.a.num1),\(getMult.a.num2)")
        print("getMult diff\(getMult.b.no1),\(getMult.b.no2)")

        
        let result = sum(num1: 1, num2: 5, callback: +);
        print("arrayReduce:\(result)");
        return true
    }
    
    typealias Block = (Int,Int)->Int
    
    func sum(num1:Int,num2:Int,callback:Block) -> Int {
        callback(num1,num2);
    }
    
    /// 冒泡排序
    /// - Parameter array: 待排序数组
    /// - Returns: 排序完数组
    func bubbleSort(_ array: [Int]) -> [Int] {
        if array.count <= 1 {
            return array;
        }
        var newArray = array;
        for i in 0..<newArray.count-1 {
            if newArray[i] > newArray[i+1] {
                let temp = newArray[i];
                newArray[i] = newArray[i+1];
                newArray[i+1] = temp;
            }
        }
        var arr = bubbleSort(Array(newArray[0..<newArray.count-1]));
        arr.append(newArray[newArray.count-1]);
        return arr;
    }
    
    /// 选择排序
    /// - Parameter array: 待排序数组
    /// - Returns: 排序完数组
    func selectionSort(_ array: [Int]) -> [Int] {
        if array.count <= 1 {
            return array;
        }
        var newArray = array;
        var max = newArray[0];
        var index = 0;
        for i in 1..<newArray.count {
            if newArray[i] > max {
                max = newArray[i];
                index = i;
            }
        }
        if index != newArray.count - 1 {
            newArray[index] = newArray[newArray.count - 1];
            newArray[newArray.count - 1] = max;
        }
        var arr = selectionSort(Array(newArray[0..<newArray.count-1]));
        arr.append(newArray[newArray.count-1]);
        return arr;
    }
    
    /// 插入排序
    /// - Parameter array: 待排序数组
    /// - Returns: 排序完数组
    func insetionSort(_ array: [Int]) -> [Int] {
        if array.count <= 1 {
            return array;
        }
        var newArray = array;
        for i in 1..<newArray.count {
            let val = newArray[i];
            for j in (0..<i).reversed() {
                if val < newArray[j] {
                    newArray[j+1] = newArray[j];
                } else {
                    newArray[j+1] = val;
                    break;
                }
            }
        }
        return newArray;
    }
    
    /// 归并排序
    /// - Parameter array: 待排序数组
    /// - Returns: 排序完数组
    func mergeSort(_ array: [Int]) -> [Int] {
        if array.count <= 1 {
            return array;
        }
        var newArray = array;
        if newArray.count == 2 {
            if newArray[0] > newArray[1] {
                let temp = newArray[1];
                newArray[1] = newArray[0];
                newArray[0] = temp;
            }
            return newArray;
        }
        newArray = [];
        var leftArray = mergeSort(Array(array[0..<Int(array.count/2)]));
        var rightArray = mergeSort(Array(array[Int(array.count/2)..<array.count]));
        while leftArray.count > 0 && rightArray.count > 0 {
            if leftArray[0] < rightArray[0] {
                newArray.append(leftArray[0]);
                leftArray.remove(at: 0);
            } else {
                newArray.append(rightArray[0]);
                rightArray.remove(at: 0);
            }
        }
        if leftArray.count != 0 {
            newArray.append(contentsOf: leftArray);
        }
        if rightArray.count != 0 {
            newArray.append(contentsOf: rightArray);
        }
        return newArray;
    }
    
    /// 快速排序
    /// - Parameter array: 待排序数组
    /// - Returns: 排序完数组
    func quickSort(_ array: [Int]) -> [Int] {
        if array.count <= 1 {
            return array;
        }
        var newArray = array;
        if array.count == 2 {
            if newArray[0] > newArray[1] {
                let temp = newArray[0];
                newArray[0] = newArray[1];
                newArray[1] = temp;
            }
            return newArray;
        }
        let sign = newArray[0];
        var i = 0;
        var j = newArray.count - 1;
        while i < j {
            while newArray[j] >= sign && i < j {
                j = j - 1;
            }
            while newArray[i] <= sign && i < j {
                i = i + 1;
            }
            if i < j {
                let temp = newArray[i];
                newArray[i] = newArray[j];
                newArray[j] = temp;
            }
        }
        newArray[0] = newArray[i];
        newArray[i] = sign;
        
        var result = quickSort(Array(newArray[0..<i]));
        result.append(sign);
        result.append(contentsOf: quickSort(Array(newArray[i+1..<newArray.count])));
        return result;
    }

}

