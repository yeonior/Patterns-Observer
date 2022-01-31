//
//  ConcreteObserver.swift
//  Patterns-Observer
//
//  Created by Ruslan on 31.01.2022.
//

import Foundation

class ConcreteObserver: Observer {
    
    func update(subject: MyNotificationCenter) {
        print("FirstObserver: \(subject.state)")
    }
    
}
