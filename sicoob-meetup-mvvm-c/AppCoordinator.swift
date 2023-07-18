//
//  AppCoordinator.swift
//  sicoob-meetup-mvvm-c
//
//  Created by Bruno T. Lemgruber Correa on 14/07/23.
//

import Foundation
import UIKit

class AppCoordinator: BaseCoordinator {
    
    let NEEDS_LOGIN = true
    
    let window: UIWindow?
    
    lazy var rootViewController: UINavigationController = {
        return UINavigationController()
    }()
    
    init(windows: UIWindow?) {
        self.window = windows
    }
    
    override func start() {
        guard let window = window else { return }
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        if NEEDS_LOGIN {
            loginFlow()
        } else {
            let user = UserModel(name: "admin")
            profileFlow(with: user)
        }
    }
    
    private func loginFlow(){
        let loginCoordinator = LoginCoordinator(navigationController: self.rootViewController)
        loginCoordinator.delegate = self
        store(coordinator: loginCoordinator)
        loginCoordinator.start()
        
    }
    
    private func profileFlow(with user: UserModel){
        let profileCoordinator = ProfileCoordinator(navigationController: self.rootViewController, with: user)
        profileCoordinator.delegate = self
        store(coordinator: profileCoordinator)
        profileCoordinator.start()
        
    }
    
}

extension AppCoordinator: LoginCoordinatorDelegate {
    
    func didFinishLoginCordinator(coordinator: Coordinator, with user: UserModel) {
        self.free(coordinator: coordinator)
        self.profileFlow(with: user)
        
    }
}

extension AppCoordinator: ProfileCoordinatorDelegate {
    
    func didFinishProfileCordinator(coordinator: Coordinator) {
        self.free(coordinator: coordinator)
        self.loginFlow()
        
    }
}
