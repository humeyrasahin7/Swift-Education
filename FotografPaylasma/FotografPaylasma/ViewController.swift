//
//  ViewController.swift
//  FotografPaylasma
//
//  Created by Hümeyra Şahin on 17.07.2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sifreTextFiel: UITextField!
    
    @IBAction func girisYap(_ sender: Any) {
        if emailTextField.text != "" && sifreTextFiel.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: sifreTextFiel.text!) { authdataresult, error in
                if error != nil {
                    self.hataMesaji(titleInput: "hata", messageInput: error!.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            self.hataMesaji(titleInput: "hata", messageInput: "mail ve parola giriniz")
        }
        
        
        
        
    }
    @IBAction func kayitOl(_ sender: Any) {
        
        if emailTextField.text != "" && sifreTextFiel.text != ""{
            Auth.auth().createUser(withEmail: emailTextField.text!, password: sifreTextFiel.text!) { (authdataresult, error) in
                if error != nil {
                    self.hataMesaji(titleInput: "hata", messageInput: error!.localizedDescription)
                    
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
                
            }
        
        } else {
            hataMesaji(titleInput: "HATA!", messageInput: "Kullanıcı ya da Parola Eksik")
        }
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    func hataMesaji (titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

}

