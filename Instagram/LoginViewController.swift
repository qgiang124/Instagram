//
//  LoginViewController.swift
//  Instagram
//
//  Created by Giang Tran on 10/14/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.usernameField.delegate = self
        self.passwordField.delegate = self

        // Do any additional setup after loading the view.
    }
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password){
            (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginToHome", sender: nil)
            } else{
                print("Error: \(error?.localizedDescription)")

            }
         }
    }
    
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground{ (success, error) in
            if success{
                self.performSegue(withIdentifier: "loginToHome", sender: nil)
            } else{
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return false
    }
}
