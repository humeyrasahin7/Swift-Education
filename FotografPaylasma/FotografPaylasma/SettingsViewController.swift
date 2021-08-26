//
//  SettingsViewController.swift
//  FotografPaylasma
//
//  Created by Hümeyra Şahin on 17.07.2021.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cikisYap(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toViewController", sender: nil)
        } catch  {
            print("hata")
        }
        
        
    }
    

}
