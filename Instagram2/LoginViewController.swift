//
//  LoginViewController.swift
//  Instagram2
//
//  Created by Quintin Frerichs on 2/28/16.
//  Copyright © 2016 Quintin Frerichs. All rights reserved.
//

import UIKit
import Parse
class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UITextField!
    
    @IBOutlet weak var passwordLabel: UITextField!
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onLogin(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usernameLabel.text!, password: passwordLabel.text!) { (user:PFUser?, error:NSError?) -> Void in
            if user != nil{
                print("you're logged in")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
        }
    }
    

    @IBAction func onSignUp(sender: AnyObject) {
        let newUser = PFUser()
        newUser.username = usernameLabel.text
        newUser.password = passwordLabel.text
       
        newUser.signUpInBackgroundWithBlock { (success:Bool, error:NSError?) -> Void in
            if success{
                print("Yay, created a user")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
            else{
                print(error?.localizedDescription)
                if error!.code == 202{
                    print("Username is taken")
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
