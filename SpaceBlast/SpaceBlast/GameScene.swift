//
//  GameScene.swift
//  SpaceBlast
//
//  Created by Ebony Nyenya on 2/9/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var screenCenter: CGPoint!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
       
        //setting the position of the ship and adding it to the view and calling the create moon function
      screenCenter = view.center
        
        createMoon()
        
        let ship = SKSpriteNode(imageNamed: "ship")
        
        ship.position = screenCenter
        
        self.addChild(ship)
        
      // add gestures up and down to move ship
        // make "pfft" sound when ship moves
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
        
       //shoot ship beams
            
    //make sound "pew, pew"
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func createMoon () {
        
        
        //creating the moon shape and adding it to the view
        let moon = SKShapeNode(ellipseOfSize: CGSizeMake(500,500))
        
        moon.strokeColor = SKColor.clearColor()
        moon.fillColor = SKColor(white:0.9, alpha: 1.0)
        moon.position = CGPointMake(screenCenter.x, -300)
        
        moon.xScale = 2.5
        moon.yScale = 2.5
        
        self.addChild(moon)
        
        //adding craters on the moon
        
        let craters: [(CGPoint, CGFloat)] = [
            
            (CGPointMake(40, 50),50),
            (CGPointMake(180, 100),30),
            (CGPointMake(100, -50),20),
            (CGPointMake(120, -80),10),
            (CGPointMake(-40, -150),10),
            (CGPointMake(-140, -100),45),
            (CGPointMake(-180, -50),38),
            (CGPointMake(-10, -50),20)
            
            
        ]
        
        for (position,size) in craters {
            
            let crater = SKShapeNode(ellipseOfSize: CGSizeMake(size, size))
            crater.fillColor = SKColor(white: 0.8, alpha: 1.0)
            crater.position = position
            
            moon.addChild(crater)
            
        }
        
        //makes the moon rotate
        let moonRotation = SKAction.rotateByAngle(CGFloat(M_PI), duration: 20)
        
        moon.runAction(SKAction.repeatActionForever(moonRotation))
        

    }
    
}
