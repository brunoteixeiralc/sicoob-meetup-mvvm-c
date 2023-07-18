//
//  ProfileViewModel.swift
//  sicoob-meetup-mvvm-c
//
//  Created by Bruno T. Lemgruber Correa on 17/07/23.
//

import Foundation

public protocol ProfileViewModelCoodinatorDelegate: AnyObject {
    func logout()
}

class ProfileViewModel: NSObject {
    public let user: UserModel
    public weak var coordinatorDelegate: ProfileViewModelCoodinatorDelegate?
    
    public init(user: UserModel) {
        self.user = user
    }
    
    public func deleteDataAndLogOut() -> Void {
        self.coordinatorDelegate?.logout()
    }
    
}
