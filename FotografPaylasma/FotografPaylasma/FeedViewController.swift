//
//  FeedViewController.swift
//  FotografPaylasma
//
//  Created by Hümeyra Şahin on 17.07.2021.
//

import UIKit
import Firebase

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    /*
    var emailDizi = [String]()
    var yorumDizi = [String]()
    var gorselDizi = [String]()
    */
    
    var postDizisi = [Post]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        firebaseVerileriAl()
    }
    
    
     
    func firebaseVerileriAl(){
        let firebase = Firestore.firestore()
        
        firebase.collection("Post").order(by: "tarih", descending: true).addSnapshotListener { (Snapshot, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                if  Snapshot?.isEmpty != true {
                    self.postDizisi.removeAll(keepingCapacity: false)
                    for document in Snapshot!.documents {
                        if let gorselUrl = document.get("gorselUrl") as? String {
                            
                        
                            if let yorum = document.get("yorum") as? String {
                            
                        
                                if let mail = document.get("email") as? String {
                                    let post = Post(email: mail, yorum: yorum, gorselUrl: gorselUrl)
                                    self.postDizisi.append(post)
                            
                        }
                        }
                        }
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postDizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        /*
        cell.mailText.text = emailDizi[indexPath.row]
        cell.yorumTextField.text = yorumDizi[indexPath.row]
        cell.feedImageView.image = UIImage(named: "seciliGorsel")
 */
        cell.mailText.text = postDizisi[indexPath.row].email
        cell.yorumTextField.text = postDizisi[indexPath.row].yorum
        cell.feedImageView.image = UIImage(named: "seciliGorsel")
        return cell
    }
  

}
