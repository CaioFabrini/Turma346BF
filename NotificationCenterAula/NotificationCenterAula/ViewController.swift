//
//  ViewController.swift
//  NotificationCenterAula
//
//  Created by Caio on 07/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chooseButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configObserver()
    }
    
    func configObserver(){
        //imac
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateImage(notification:)), name: Notification.Name(NameNotification.imac.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateNameLabel(notification:)), name: Notification.Name(NameNotification.imac.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateBackGround(notification:)), name: Notification.Name(NameNotification.imac.rawValue), object: nil)
        
        //mac
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateImage(notification:)), name: Notification.Name(NameNotification.macbook.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateNameLabel(notification:)), name: Notification.Name(NameNotification.macbook.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateBackGround(notification:)), name: Notification.Name(NameNotification.macbook.rawValue), object: nil)
    }
    
    @objc func updateImage(notification: NSNotification){
        let isLight = notification.name == Notification.Name(NameNotification.imac.rawValue)
        let image = isLight ? UIImage(named: "imac_pro") : UIImage(named: "macbook_pro")
        self.logoImageView.image = image
    }
    
    @objc func updateNameLabel(notification: NSNotification){
        let isLight = notification.name == Notification.Name(NameNotification.imac.rawValue)
        let text = isLight ? "Imac das galaxias" : "MacBook Pro"
        self.nameLabel.text = text
    }
    
    @objc func updateBackGround(notification: NSNotification){
        let isLight = notification.name == Notification.Name(NameNotification.imac.rawValue)
        let color:UIColor = isLight ? .cyan : .red
        self.view.backgroundColor = color
    }

    @IBAction func tappedChooseButton(_ sender: UIButton) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionViewController") as? SelectionViewController
        selectionVC?.modalPresentationStyle = .fullScreen
        self.present(selectionVC ?? UIViewController(), animated: true)
    }
    
}

