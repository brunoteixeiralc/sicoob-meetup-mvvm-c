//
//  LoginViewController.swift
//  sicoob-meetup-mvvm-c
//
//  Created by Bruno T. Lemgruber Correa on 14/07/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    var viewModel: LoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        self.viewModel?.onTapLogin()
    }
    
    @IBAction func didTapRegister(_ sender: UIButton) {
        self.viewModel?.onTapRegister()
    }
}
