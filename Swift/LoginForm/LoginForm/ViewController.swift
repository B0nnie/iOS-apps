//
//  ViewController.swift
//  LoginForm
//
//  Created by Ebony Nyenya on 1/26/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configureTextField()
        configureSecureTextField()
        configureButton()
        
    
    }//*end of viewDidLoad method

    
    func configureTextField() {
        
        username.placeholder = NSLocalizedString ("Username", comment: "")
        email.placeholder = NSLocalizedString ("Email", comment: "")
    }
    
    func configureSecureTextField() {
        password.secureTextEntry = true
        password.placeholder = NSLocalizedString ("Password", comment: "")
        password.returnKeyType = .Done
        password.clearButtonMode = .Always
        

    }
    
    func configureButton() {
        
        let buttonTitle = NSLocalizedString("Login", comment: "")
        
        login.setTitle(buttonTitle, forState: .Normal)
        
        login.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)

    
    }//*end of configure button method*
    
    
    
    func buttonClicked(sender:AnyObject) {
        
        
       if username.text.isEmpty || password.text.isEmpty || email.text.isEmpty
       {
         var alert = UIAlertController(title: "Error", message: "Please complete all fields", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Login", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        } else if username != "" && password != "" && email != "" {
            
            var alert = UIAlertController(title: "Logged in", message: "", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            println("logged in")
            
        }
      
        
    } //*end of buttonClicked method*

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

