//
//  LoginCoordinator.swift
//  sicoob-meetup-mvvm-c
//
//  Created by Bruno T. Lemgruber Correa on 14/07/23.
//

import Foundation
import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
  func didFinishLoginCordinator(coordinator: Coordinator, with user: UserModel)
}

class LoginCoordinator: BaseCoordinator{
    
    private let navigationController: UINavigationController
    public weak var delegate: LoginCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        if let controller = self.loginController {
            self.navigationController.setViewControllers([controller], animated: true)
        }
    }
    
    lazy var loginController: LoginViewController? = {
        let viewModel = LoginViewModel()
        viewModel.coordinatorDelegate = self
        
        let controller = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        controller?.viewModel = viewModel
        
        return controller
    }()
    
    lazy var registerController: RegisterViewController? = {
        let controller = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        return controller
    }()
    
}

extension LoginCoordinator: LoginViewModelCoodinatorDelegate {
    
    func loginDidSuccess(with user: UserModel) {
        self.delegate?.didFinishLoginCordinator(coordinator: self, with: user)
    }
    
    func loginDidFail(with error: NSError) {}
    
    func didTapRegister() {
        if let controller = self.registerController {
          self.navigationController.pushViewController(controller, animated: true)
        }
    }
    
}

