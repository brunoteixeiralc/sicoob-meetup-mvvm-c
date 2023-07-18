//
//  LoginViewModel.swift
//  sicoob-meetup-mvvm-c
//
//  Created by Bruno T. Lemgruber Correa on 14/07/23.
//

import Foundation

public protocol LoginViewModelCoodinatorDelegate: AnyObject {
    func loginDidSuccess(with user: UserModel)
    func loginDidFail(with error: NSError)
    func didTapRegister()
    
}

class LoginViewModel: NSObject {
    private let login_success = true
    public weak var coordinatorDelegate: LoginViewModelCoodinatorDelegate?
    
    public func onTapLogin() -> Void {
        let dataFromServer = UserModel(name: "Bruno")
        if login_success {
            self.coordinatorDelegate?.loginDidSuccess(with: dataFromServer)
        } else {
            self.coordinatorDelegate?.loginDidFail(with: NSError(domain: "", code: 401))
        }
    }
    
    public func onTapRegister() -> Void {
        self.coordinatorDelegate?.didTapRegister()
    }
    
}
