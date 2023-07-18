//
//  ProfileViewController.swift
//  sicoob-meetup-mvvm-c
//
//  Created by Bruno T. Lemgruber Correa on 17/07/23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var userLabel: UILabel!
    
    var viewModel: ProfileViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userLabel.text = self.viewModel?.user.name
        self.rightNavigationBar()
    }
    
    private func rightNavigationBar() {
      self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout",
                                                               style: .plain,
                                                               target: self,
                                                               action: #selector(logoutUser))
    }
    
    @objc func logoutUser() {
        self.viewModel?.deleteDataAndLogOut()
    }
    
}
