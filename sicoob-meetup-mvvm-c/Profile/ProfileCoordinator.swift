//
//  ProfileCoordinator.swift
//  sicoob-meetup-mvvm-c
//
//  Created by Bruno T. Lemgruber Correa on 14/07/23.
//

import Foundation
import UIKit

protocol ProfileCoordinatorDelegate: AnyObject {
  func didFinishProfileCordinator(coordinator: Coordinator)
}

class ProfileCoordinator: BaseCoordinator {
    
    private let navigationController: UINavigationController
    private let user: UserModel
    public weak var delegate: ProfileCoordinatorDelegate?
    
    init(navigationController: UINavigationController, with user: UserModel) {
        self.navigationController = navigationController
        self.user = user
    }
    
    override func start() {
        if let controller = self.profileController {
            self.navigationController.setViewControllers([controller], animated: false)
        }
    }
    
    lazy var profileController: ProfileViewController? = {
        let controller = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController
        let viewModel = ProfileViewModel(user: self.user)
        controller?.viewModel = viewModel
        controller?.viewModel?.coordinatorDelegate = self
        return controller
    }()
    
}

extension ProfileCoordinator: ProfileViewModelCoodinatorDelegate {
    
    func logout() {
        self.delegate?.didFinishProfileCordinator(coordinator: self)
    }
}
