//
//  ViewController.swift
//  PraxisLogin
//
//  Created by Zanette Ciriaco on 15/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var request = Request()
    
    private var userLabel: UITextField!
    private var passwordLabel: UITextField!
    private var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUserLabel()
        setupPasswordLabel()
        setupButton()
    }
    
    private func setupUserLabel(){
        userLabel = UITextField()
        view.addSubview(userLabel)
        
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.placeholder = "Email"
        userLabel.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        userLabel.layer.borderWidth = 1.0
        
        userLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        userLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        userLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        userLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
    
    private func setupPasswordLabel(){
        passwordLabel = UITextField()
        view.addSubview(passwordLabel)
        
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.placeholder = "Senha"
        passwordLabel.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        passwordLabel.layer.borderWidth = 1.0
        
        passwordLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordLabel.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 20).isActive = true
        passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
    }
    
    private func setupButton () {
        loginButton = UIButton()
        view.addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Entrar", for: .normal)
        loginButton.backgroundColor = .blue
        
        loginButton.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        
        loginButton.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 20).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    @objc func handleButton () {
        let sendLogin = SendLogin(email: userLabel.text!, password: passwordLabel.text!, firebaseToken: "ksks")
        
        request.post(sendLogin) {}
    
    }


}


