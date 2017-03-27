//
//  LoginViewController.swift
//  SureWalk Driver
//
//  Created by Rohan Trivedi on 3/20/17.
//  Copyright © 2017 Rohan Trivedi. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    @IBAction func onSignIn(_ sender: Any)
    {
        PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!) { (user: PFUser?, error: Error?) in
            if user != nil
            {
                print("User log in successful")
                self.performSegue(withIdentifier: "loginsegue", sender: nil)
            }
            else
            {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    @IBAction func onSignUp(_ sender: Any)
    {
        let newUser = PFUser()
        
        newUser.username = usernameTextField.text
        newUser.password = passwordTextField.text
        newUser["type"] = "driver"
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success
            {
                print("User sign up successful")
                self.performSegue(withIdentifier: "loginsegue", sender: nil)
            }
            else
            {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    

}
