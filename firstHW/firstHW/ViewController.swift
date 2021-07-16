//
//  ViewController.swift
//  firstHW
//
//  Created by Hümeyra Şahin on 18.05.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    var isimDizisi = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate =  self
        tableView.dataSource =  self
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(eklemeButonuTiklandı))
        
        verileriAl()
        
    }
    
    func verileriAl(){
        let appDelegate =  UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Sebze")
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let sonuclar = try context.fetch(fetchRequest)
            for sonuc in sonuclar as! [NSManagedObject]{
                
                if let isim = sonuc.value(forKey: "isim") as? String {
                    isimDizisi.append(isim)
                }
                
            }
            
        } catch {
            print("hata")
        }
        tableView.reloadData()
    }

    @objc func eklemeButonuTiklandı (){
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isimDizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = isimDizisi[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Sebze")
            let isim = isimDizisi[indexPath.row]
            
            fetchReq.predicate = NSPredicate(format: "id = %@", isim)
            fetchReq.returnsObjectsAsFaults = false
            do {
                
                let sonuclar = try context.fetch(fetchReq)
                if sonuclar.count > 0 {
                    for sonuc in sonuclar as! [NSManagedObject] {
                        
                        if let isim = sonuc.value(forKey: "isim") as? String  {
                            if isim == isimDizisi[indexPath.row]{
                                context.delete(sonuc)
                                isimDizisi.remove(at: indexPath.row)
                                isimDizisi.remove(at: indexPath.row)
                                self.tableView.reloadData()
                                
                                do {
                                    try context.save()
                                } catch  {
                                    
                                }
                                break
                                
                            }
                        }
                        
                    }
                }
                
                
                
            } catch  {
                 print("hata")
            }
        }
        
        
        
    }
}











/*} else {
bool = false
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
*/
