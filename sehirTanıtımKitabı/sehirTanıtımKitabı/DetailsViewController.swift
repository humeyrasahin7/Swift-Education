//
//  DetailsViewController.swift
//  sehirTanıtımKitabı
//
//  Created by Hümeyra Şahin on 13.04.2021.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblSehirIsmi: UILabel!
    @IBOutlet weak var lblSehirBolgesi: UILabel!
    
    var secilenSehir : Sehir? //geledebilir gelmeyedebilir gelceğini biliyorum ama initialize yapmama gerek yok
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblSehirIsmi.text = secilenSehir?.isim
        lblSehirBolgesi.text = secilenSehir?.bolge
        imageView.image = secilenSehir?.gorsel
    }
    

    
}
