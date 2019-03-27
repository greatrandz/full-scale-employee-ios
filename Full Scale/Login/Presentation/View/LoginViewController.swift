//
//  LoginViewController.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 25/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private let viewModel: LoginViewModel
    @IBOutlet var usernameLabel: UITextField!
    @IBOutlet private var passwordLabel: UITextField!
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: LoginViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = "superadmin"
        passwordLabel.text = "5u115c@13!"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        viewModel.login(email: usernameLabel.text!, password: passwordLabel.text!)
    }
    
}
