//
//  Webservice.swift
//  NewsProject
//
//  Created by Hümeyra Şahin on 18.07.2021.
//

import Foundation

class Webservice {
    
    func haberleriIndir(url: URL, completion: @escaping ([News]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
             let haberlerDizisi = try? JSONDecoder().decode([News].self, from: data)
             if let haberlerDizisi = haberlerDizisi {
                completion(haberlerDizisi)
                }
            }
        }.resume()
        
    }
    
}
