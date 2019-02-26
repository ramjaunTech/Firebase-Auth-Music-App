//
//  ViewController.swift
//  Music app
//
//  Created by shoaib ramjaun on 2019-02-24.
//  Copyright © 2019 shoaib ramjaun. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class ViewController: UIViewController {
    @IBOutlet weak var SignUpLabel: UILabel!
    @IBOutlet weak var SignupButtonOutlet: UIButton!
    @IBOutlet weak var CancelButtonOutlet: UIButton!
    // Action outlets
    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var EmailAddressTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var ConfirmPasswordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        SignUpLabel.clipsToBounds = true
        SignUpLabel.layer.cornerRadius = 15
        SignupButtonOutlet.layer.cornerRadius = 15
        CancelButtonOutlet.layer.cornerRadius = 15
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func SignUpButtonTyped(_ sender: UIButton) {
        guard let firstName = FirstNameTextField.text, !firstName.isEmpty else {
            showMessage(titleToDisplay: "First Name Error!", messageToDisplay: "Please enter a valid First Name")
            return;
        }
        guard let lastName = LastNameTextField.text, !lastName.isEmpty else {
            showMessage(titleToDisplay: "Last Name Error!", messageToDisplay: "Please enter a valid Last Name")
            return;
        }
        guard let email = EmailAddressTextField.text, !email.isEmpty else{
            showMessage(titleToDisplay: "Email Error", messageToDisplay: "Please enter a valid email address");
            return;
        }
        guard let PasswordText = PasswordTextField.text, !PasswordText.isEmpty else{
            showMessage(titleToDisplay: "Password Error", messageToDisplay: "Please enter a password");
            return;
        }
        
        guard let ConfirmPasswordText = ConfirmPasswordTextField.text, !ConfirmPasswordText.isEmpty else{
            showMessage(titleToDisplay: "Confirm Password Error", messageToDisplay: "Please re-enter a password to confirm");
            
            return;
        }
        
        
        if (PasswordText != ConfirmPasswordText){
            showMessage(titleToDisplay: "Password Mismatch", messageToDisplay: "Please re-enter your password correctly")
        }
        
        Auth.auth().createUser(withEmail: email, password: PasswordText) { (user, Error) in
            if let error = Error{
                self.showMessage(titleToDisplay: "Error Sign UP", messageToDisplay: error.localizedDescription)
                return
            }
            if let user = user {
                self.showMessage(titleToDisplay: "Successful", messageToDisplay: "User Successfully signed up")
                var databaseReference: DatabaseReference!
                databaseReference = Database.database().reference()
                let userDetails:[String:String] = ["FirstName": firstName, "LastName":lastName ]
                databaseReference.child("users").child(user.user.uid).setValue(["userDetails":userDetails])
            }
        }
       
        
        
        
        
        
    }
    @IBAction func CanceledTapped(_ sender: UIButton) {
        
        
    }
    
    public func showMessage(titleToDisplay:String, messageToDisplay:String)
    {
        let alertController = UIAlertController(title: titleToDisplay, message: messageToDisplay, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            (action:UIAlertAction!) in
            print ("OK button tapped");
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}

