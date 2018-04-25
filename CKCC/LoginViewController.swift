//
//  LoginViewController.swift
//  CKCC
//
//  Created by Bun Leap on 3/7/18.
//  Copyright © 2018 Cambodia-Korea Cooperation Center. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
 
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func onLoginButtonClick(_ sender: Any) {
        
        // Show loading and hide login button
        loginButton.isHidden = true
        loadingActivityIndicator.isHidden = false
                
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        // Create parameters to submit
        let params = "username=\(username)&password=\(password)"
        
        // Submit data to server
        let loginUrl = URL(string: "http://test.js-cambodia.com/ckcc/login.php")!
        
        var loginRequest = URLRequest(url: loginUrl)
        loginRequest.httpMethod = "POST"
        loginRequest.httpBody = params.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: loginRequest) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            let loginResponse = try? jsonDecoder.decode(LoginResponse.self, from: data!)
            if loginResponse?.code == 0 {
                DispatchQueue.main.async {
                    // Move user to home view controller
                    self.performSegue(withIdentifier: "segue_home", sender: nil)
                }
            } else {
                DispatchQueue.main.async {
                    // Hide loading and show login button
                    self.loadingActivityIndicator.isHidden = true
                    self.loginButton.isHidden = false
                    
                    // Show error meesage to user
                    self.showLoginErrorMessage(loginResponse!.message)
                }
            }
        }
        task.resume()
        
    }
    
    func showLoginErrorMessage(_ message: String) {
        let alertController = UIAlertController(title: "Login Fail", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}













