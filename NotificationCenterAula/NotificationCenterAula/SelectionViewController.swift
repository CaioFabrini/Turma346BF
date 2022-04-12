//
//  SelectionViewController.swift
//  NotificationCenterAula
//
//  Created by Caio on 07/04/22.
//

import UIKit

enum NameNotification:String{
    case macbook
    case imac
}

class SelectionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func firstMacButton(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name(NameNotification.macbook.rawValue), object: nil)
        dismiss(animated: true)
    }
    
    @IBAction func lastMacButton(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name(NameNotification.imac.rawValue), object: nil)
        dismiss(animated: true)
    }
    
    
    
}
