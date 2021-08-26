//
//  UploadViewController.swift
//  FotografPaylasma
//
//  Created by Hümeyra Şahin on 17.07.2021.
//

import UIKit
import Firebase

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(gorselSec))
        imageView.addGestureRecognizer(gesture)
        
    }
    
    @objc func gorselSec(){
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func kaydedildi(_ sender: Any) {
        let storage = Storage.storage()
        let storageReferance = storage.reference()
        
        let mediaFolder = storageReferance.child("media")
        
        if let data  = imageView.image?.jpegData(compressionQuality: 0.5){
            
            let uuid = UUID().uuidString
            
            let imageReferance = mediaFolder.child("\(uuid).jpg")
            
            imageReferance.putData(data, metadata: nil) { (storagemetadata, error) in
                if error != nil {
                    self.hata(hatamesaji: "hata", hata: error?.localizedDescription ?? "hata mesajı aldınız")
                
                } else {
                imageReferance.downloadURL { (url, error2) in
                    if error2 == nil {
                        let imageUrl = url?.absoluteString
                        if let imageUrl = imageUrl {
                            
                            let firestoreDatabase = Firestore.firestore()
                            let firestorePost = ["gorselUrl" : imageUrl, "yorum" : self.textField.text!, "email" : Auth.auth().currentUser?.email, "tarih": FieldValue.serverTimestamp()] as [String : Any]
                            firestoreDatabase.collection("Post").addDocument(data: firestorePost) { (error) in
                                if error != nil {
                                    self.hata(hatamesaji: "hata", hata: "tekrar deneyiniz")
                                } else {
                                    
                                    
                                    self.imageView.image = UIImage(named: "seciliGorsel")
                                    self.textField.text = ""
                                    self.tabBarController?.selectedIndex = 0
                                }
                            }
                            
                            
                            
                            
                            
                        }
                        
                      
                        
                       
                        
                        
                        
                        
                        
                    }
                    
                }
            }
        }
        
    }
    
    }
    
    func hata(hatamesaji: String, hata: String) {
        let allert = UIAlertController(title: "hatamesaji", message: hatamesaji, preferredStyle: UIAlertController.Style.alert)
        let okbt = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
        allert.addAction(okbt)
        self.present(allert, animated: true, completion: nil)
    }
}
