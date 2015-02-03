//
//  ViewController.swift
//  ScareTheBug_inclass
//
//  Created by Ebony Nyenya on 1/28/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

import UIKit


let SCREEN_WIDTH = UIScreen.mainScreen().bounds.width

let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height


class ViewController: UIViewController {
    
    var bug = UIImageView (frame: CGRectMake(0, 0, 60, 50))
    
    var foot: CGFloat = 1
    var lastFootPrint = CGPointZero

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        bug.image = UIImage(named: "bug")
        bug.center = view.center
        
        view.addSubview(bug)
        
       // NSTimer.scheduledTimerWithTimeInterval(0.01, invocation: <#NSInvocation#>, repeats: <#Bool#>)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        if let touch = touches.allObjects.first as? UITouch {
            
        }
        
        
    }


}

