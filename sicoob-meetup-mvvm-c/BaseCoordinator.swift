//
//  BaseCoordinator.swift
//  sicoob-meetup-mvvm-c
//
//  Created by Bruno T. Lemgruber Correa on 14/07/23.
//

import Foundation

class BaseCoordinator: Coordinator {
    
    var childCoodinator: [Coordinator] = []
    
    func start() {}
    
}
