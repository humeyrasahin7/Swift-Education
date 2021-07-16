//
//  DetailsViewController.swift
//  firstHW
//
//  Created by Hümeyra Şahin on 18.05.2021.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet weak var txtAgirlik: UITextField!
    @IBOutlet weak var txtIsim: UITextField!
    @IBOutlet weak var btnKaydet: UIButton!
    
    var secilenUrun = ""
    let urunler = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(klavyeyiKapat))
        view.addGestureRecognizer(gestureRecognizer)
        
        
        
    }
    @objc func klavyeyiKapat(){
        view.endEditing(true)
    }
    
    @IBAction func btnKaydet(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context =  appDelegate.persistentContainer.viewContext
        let liste = NSEntityDescription.insertNewObject(forEntityName: "Sebze", into: context)
        let isimTxt = txtIsim.text
        let agirliktxt = Double(txtAgirlik.text!)
        print("txt: " + isimTxt!)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Sebze")
        let sortData = NSSortDescriptor(key: "agirlik", ascending: true)
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.sortDescriptors = [sortData]
        //fetchRequest.fetchLimit = 1
        var bool = true
        
        do{
            let sonuclar = try context.fetch(fetchRequest)
            print("SONUÇLAR: ")
            print(sonuclar)
            
            for sonuc in sonuclar as! [NSManagedObject]{
                
                let isim = sonuc.value(forKey: "isim") as! String
                var agirlik = sonuc.value(forKey: "agirlik") as! Double
                print("listeden gelen isim: " + isim)
                print(isimTxt?.compare(isim, options: .caseInsensitive) == .orderedSame)
                
                if isimTxt?.compare(isim, options: .caseInsensitive) ==  .orderedSame{
                    print("AYNI İSİM: " + isim)
                    agirlik = agirlik + agirliktxt!
                    liste.setValue(agirlik, forKey: "agirlik")
                    
                    do{
                        try context.save()
                        print("yeni ağırlık kaydedildi: ")
                        print(agirlik)
                    } catch{
                        print("hata isim karşılaştırma")
                    }
                    
                } else {
                    bool = false
                
                }
            }
            
            if bool == false {
                liste.setValue(isimTxt, forKey: "isim")
                if let agirlik = Double(txtAgirlik.text!){
                    liste.setValue(agirlik, forKey: "agirlik")
                print("malzeme listede yok yeni malzeme kaydedildi")
                    do{
                        try context.save()
                        print("kaydedildi")
                    } catch{
                        print("hata isim karşılaştırma")
                    }
            
            }
            }
            
        } catch {
            print("hata")
        }
        
    

        
        
        
        
        
        
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "veriGirildi"), object: nil)
        self.navigationController?.popViewController(animated: true)
        
        
    }
    


}
