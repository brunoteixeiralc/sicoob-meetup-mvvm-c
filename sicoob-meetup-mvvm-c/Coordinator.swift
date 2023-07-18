//
//  Coordinator.swift
//  sicoob-meetup-mvvm-c
//
//  Created by Bruno T. Lemgruber Correa on 14/07/23.
//

import Foundation

protocol Coordinator: AnyObject {
    
    var childCoodinator: [Coordinator] { get set }
    func start()
    
}

extension Coordinator {
    
    func store(coordinator: Coordinator){
        childCoodinator.append(coordinator)
    }
    
    func free(coordinator: Coordinator){
        childCoodinator = childCoodinator.filter{ $0 !== coordinator }
    }
    
}
