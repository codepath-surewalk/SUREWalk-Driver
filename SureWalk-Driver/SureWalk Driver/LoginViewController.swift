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
        // TODO: add input validation like in onSignUp
        PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!) { (user: PFUser?, error: Error?) in
            if user != nil
            {
                print("User log in successful")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else
            {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    @IBAction func onSignUp(_ sender: Any)
    {
        if usernameTextField.hasText && passwordTextField.hasText {
            if let username = usernameTextField.text, let password = passwordTextField.text {
                let newUser = PFUser()
                newUser.username = username
                newUser.password = password
                newUser["type"] = "driver"
                // TODO: need info such as phone number, first/last name
                newUser.signUpInBackground { (success: Bool, error: Error?) in
                    if success {
                        print("success signing up")
                        self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    } else {
                        print("\(String(describing: error?.localizedDescription))")
                    }
                }
            }
        } else {
            print("missing username/password")
        }
    }
    

}
