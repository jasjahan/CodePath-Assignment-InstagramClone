//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Jasmine Jahan on 10/9/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usenameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usenameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password){
            (user, error) in if user != nil{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else{
                print("Error: \(String(describing: error?.localizedDescription))")

            }
        }
        
    }
    
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usenameField.text
        user.password = passwordField.text
        
        user.signUpInBackground{ (success, error) in
            if success{
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
