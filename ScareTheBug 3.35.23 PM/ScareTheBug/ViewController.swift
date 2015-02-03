//
//  ViewController.swift
//  ScareTheBug
//
//  Created by Ebony Nyenya on 1/27/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var location = CGPoint (x: 0, y: 0)
    
   
    @IBOutlet weak var bug: UIImageView!

    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        var touch : UITouch! = touches.anyObject() as UITouch
         location = touch.locationInView(self.view)
        
        
       bug.center.x += bug.center.x - location.x
       bug.center.y += bug.center.y - location.y
        
        UIImageView.animateWithDuration(
            Double(0.2),
            animations: {
                self.bug = CGRectMake(0, self.bounds.height, self.bounds.width, self.bounds.height)
            },
            completion: { finished in
                if(finished) {
                    self.removeFromSuperview()
                }
            }
        )
        
        //animatewithduration
        
        
    }

    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        var touch : UITouch! = touches.anyObject() as UITouch
        location = touch.locationInView(self.view)
        
        bug.center.x += bug.center.x - location.x
        bug.center.y += bug.center.y - location.y
        
        //bug.center = location;
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

