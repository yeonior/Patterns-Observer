//
//  ViewController.swift
//  Patterns-Observer
//
//  Created by Ruslan on 30.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stateLabel: UILabel!
    
    let myNotificationCenter = MyNotificationCenter()
    let observer = ConcreteObserver()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func updateAction(_ sender: UIButton) {
        myNotificationCenter.someBuisnessLogic()
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if sender.isOn {
            myNotificationCenter.subscribe(self)
            myNotificationCenter.subscribe(observer)
        } else {
            myNotificationCenter.unsubscribe(self)
            myNotificationCenter.unsubscribe(observer)
        }
    }
}

extension ViewController: Observer {
    
    func update(subject: MyNotificationCenter) {
        stateLabel.text = "State: \(subject.state)"
    }
}
