//
//  ViewController.swift
//  sehirTanıtımKitabı
//
//  Created by Hümeyra Şahin on 13.04.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var sehirDizisi = [Sehir]()
    var kullaniciSecimi : Sehir?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //şehirler
        let istanbul = Sehir(isim: "istanbul", bolge: "marmara", gorsel: UIImage(named:"istanbul")!)
        let ankara = Sehir(isim: "ankara", bolge: "iç anadolu", gorsel: UIImage(named:"ankara")!)
        let antalya = Sehir(isim: "antalya", bolge: "akdeniz", gorsel: UIImage(named:"antalya")!)
        
        sehirDizisi = [istanbul,ankara,antalya]
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sehirDizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=UITableViewCell()
        cell.textLabel?.text = sehirDizisi[indexPath.row].isim
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        kullaniciSecimi = sehirDizisi[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.secilenSehir = kullaniciSecimi
        }
    }

}

