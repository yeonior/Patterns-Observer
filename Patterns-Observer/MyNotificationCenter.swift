//
//  MyNotificationCenter.swift
//  Patterns-Observer
//
//  Created by Ruslan on 31.01.2022.
//

import Foundation

protocol Observer: AnyObject {
    func update(subject: MyNotificationCenter)
}

class MyNotificationCenter {
    
    var state: Int = {
       return Int(arc4random_uniform(10))
    }()
    
    private lazy var observers = [Observer]()
    
    func subscribe(_ observer: Observer) {
        print(#function)
        observers.append(observer)
    }
    
    func unsubscribe(_ observer: Observer) {
        if let index = observers.firstIndex(where: {$0 === observer}) {
            observers.remove(at: index)
            print(#function)
        }
    }
    
    func notify() {
        observers.forEach { $0.update(subject: self) }
    }
    
    func someBuisnessLogic() {
        print(#function)
        state = Int(arc4random_uniform(10))
        notify()
    }
}
