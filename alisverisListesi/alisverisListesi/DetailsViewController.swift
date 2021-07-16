//
//  DetailsViewController.swift
//  alisverisListesi
//
//  Created by Hümeyra Şahin on 13.04.2021.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var urunGorsel: UIImageView!
    @IBOutlet weak var txtIsim: UITextField!
    @IBOutlet weak var txtFiyat: UITextField!
    @IBOutlet weak var txtBeden: UITextField!
    @IBOutlet weak var kaydet: UIButton!
    
    
    var secilenUrunIsmi = " "
    var secilenUrunID : UUID?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if secilenUrunIsmi != " "  {
            kaydet.isHidden = true
         //core data seçilen ürün bilgilerini göster
            if let uuidString = secilenUrunID?.uuidString{
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Alisveris")
                fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)
                fetchRequest.returnsDistinctResults = false
                
                do {
                    let sonuclar  = try context.fetch(fetchRequest)
                    if sonuclar.count > 0 {
                        for sonuc in sonuclar as! [NSManagedObject]{
                            if let isim =  sonuc.value(forKey: "isim") as? String {
                                txtIsim.text = isim
                            }
                            if let fiyat = sonuc.value(forKey: "fiyat") as? Int {
                                txtFiyat.text = String(fiyat)
                            }
                            if let beden = sonuc.value(forKey: "beden") as? String {
                                txtBeden.text = beden
                            }
                            if let gorselData = sonuc.value(forKey: "gorsel") as? Data {
                                let image = UIImage(data: gorselData)
                                urunGorsel.image = image
                            }
                        }
                    }
                } catch  {
                    print("hata var")
                }
            }
            
        
        } else {
            kaydet.isHidden = false
            kaydet.isEnabled = false
            txtIsim.text = " "
            txtFiyat.text = " "
            txtBeden.text = " "
        }
        
        
        let gestureRecognizer=UITapGestureRecognizer(target: self, action: #selector(klavyeyiKapat))
        view.addGestureRecognizer(gestureRecognizer)
        
        urunGorsel.isUserInteractionEnabled = true
        let imageGestureRecognizer = UITapGestureRecognizer (target: self, action: #selector(gorselSec))
        urunGorsel.addGestureRecognizer(imageGestureRecognizer)
    }
    
    @objc func gorselSec(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        urunGorsel.image = info[.originalImage] as? UIImage
        kaydet.isEnabled = true
        self.dismiss(animated: true, completion: nil)
        
        
        
    }
    
    
    @objc func klavyeyiKapat (){
        view.endEditing(true)
    }

    @IBAction func btnKaydet(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate //appDelegate'ı kullanabilmemiz için
        let context = appDelegate.persistentContainer.viewContext
        
        let alisveris = NSEntityDescription.insertNewObject(forEntityName: "Alisveris", into: context)
        
        alisveris.setValue(txtIsim.text, forKey: "isim")
        alisveris.setValue(txtBeden.text, forKey: "beden")
        
        if let fiyat = Int(txtFiyat.text!){
            alisveris.setValue(fiyat, forKey: "fiyat")
        }
        alisveris.setValue(UUID(), forKey: "id")
        
        let data = urunGorsel.image!.jpegData(compressionQuality: 0.5)
        alisveris.setValue(data, forKey: "gorsel")
        do {
            try context.save()
            print("veri kaydedildi")
        } catch  {
            print("hata var")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "veriGirildi"), object: nil)
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
   
    
}
