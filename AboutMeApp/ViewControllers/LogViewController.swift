//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Boris Alexandrov on 04.07.2022.
//

import UIKit

class LogViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passTextField: UITextField!
    
    // MARK: - Private properties
    private let user = User.getUser()
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewVC = tabBarVC.viewControllers else { return }
    
        viewVC.forEach {
        if let welcomeVC = $0 as? WelcomeViewController {
            welcomeVC.user = user
        } else if let navigationVC = $0 as? UINavigationController {
            let aboutMeVC = navigationVC.topViewController as! AboutMeViewController
            aboutMeVC.user = user
        }
        }
    }
    // MARK: IBActions
    
        @IBAction func logPress() {
            if userTextField.text != user.login || passTextField.text != user.password {
                showAlert(
                    title: "Invalid login or password",
                    message: "Please, enter correct login and password",
                    textField: passTextField
                )
            }
        }
        
        @IBAction func forgotRegisterData(_ sender: UIButton) {
            sender.tag == 0
                ? showAlert(title: "Oops!", message: "Your name is \(user.login) 😉")
                : showAlert(title: "Oops!", message: "Your password is \(user.password) 😉")
        }
        
        @IBAction func unwindSegue(segue: UIStoryboardSegue) {
            userTextField.text = ""
            passTextField.text = ""
        }
        
    }
   // MARK: - Private Methods
extension LogViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

   // MARK: - Alert Controller
extension LogViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userTextField {
            passTextField.becomeFirstResponder()
        } else {
            logPress()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
}
//проверка комита
