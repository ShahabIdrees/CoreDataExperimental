//
//  LoginViewController.swift
//  LoginSignup
//
//  Created by Shahab Idrees  on 22/11/2025.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordt: UITextField!
    @IBOutlet weak var emailt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signinbutton(_ sender: Any) {
        guard let email = emailt.text, !email.isEmpty,
                      let password = passwordt.text, !password.isEmpty else {
                    showAlert("Please enter both email and password.")
                    return
                }

                // Verify from Core Data
                let isValid = CoreDataManager.shared.verifyUser(email: email, password: password)

                if isValid {
//                    showAlert("Login Successful!")
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                    if let successVC = storyboard.instantiateViewController(withIdentifier: "LoginSuccessViewController") as? LoginSuccessViewController {
                                        self.navigationController?.pushViewController(successVC, animated: true)
                                    }
                    

                    // Optional: Navigate to next screen after login
                    // performSegue(withIdentifier: "goToHome", sender: nil)
                    
                } else {
                    showAlert("Invalid email or password. Try again.")
                }
    }
    
    @IBAction func signupbutton(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                if let signupVC = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController {
//                    self.navigationController?.pushViewController(signupVC, animated: true)
//                }
    }
    @IBAction func forgotpasswordbutton(_ sender: Any) {
        showAlert("Forgot Password feature coming soon.")
    }
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
