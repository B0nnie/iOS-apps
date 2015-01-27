//
//  ViewController.swift
//  SwiftApp
//
//  Created by Ebony Nyenya on 1/26/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

import UIKit

let RED = UIColor.redColor()
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height

class ViewController: UIViewController {
    
    var viewColor = RED
    
    var name: String? {
        
        willSet {
            
            println(name)
            println (newValue)
            
        }
        
        
        didSet {
            
           println(name)
            
        }
    }
    
//    class func sayWord(word1: String, andWord word2: String) {
//        
//    }
//    
    
//    func addNumbers(number1: Int, number2: Int) -> Int {
//        
//        return number1 + number2
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

//        ViewController.sayWord("hi", andWord: "hello")
        
        
//        self. addNumbers(5, number2: 3)
//            //or
//        addNumbers(5, number2: 3)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

