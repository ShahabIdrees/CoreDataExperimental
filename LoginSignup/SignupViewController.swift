//
//  ViewController.swift
//  LoginSignup
//
//  Created by Shahab Idrees  on 22/11/2025.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var passwordtext: UITextField!
    @IBOutlet weak var confirmpasswordtext: UITextField!
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var lastnameText: UITextField!
    @IBOutlet weak var Textfirst: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signuptapbtn(_ sender: Any) {
        guard let first = Textfirst.text, !first.isEmpty,
                  let last = lastnameText.text, !last.isEmpty,
                  let email = emailtext.text, !email.isEmpty,
                  let pass = passwordtext.text, !pass.isEmpty,
                  let confirm = confirmpasswordtext.text, !confirm.isEmpty else {
                showAlert("All fields are required.")
                return
            }

            guard pass == confirm else {
                showAlert("Passwords do not match.")
                return
            }

            let result = CoreDataManager.shared.saveUser(
                firstName: first,
                lastName: last,
                email: email,
                password: pass
            )

            if result {
                showAlert("Account created successfully!")
            } else {
                showAlert("Email already exists.")
            }
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
}

