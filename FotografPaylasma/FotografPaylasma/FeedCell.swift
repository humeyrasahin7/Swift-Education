//
//  FeedCell.swift
//  FotografPaylasma
//
//  Created by Hümeyra Şahin on 17.07.2021.
//

import UIKit

class FeedCell: UITableViewCell {
    @IBOutlet weak var mailText: UILabel!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var yorumTextField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
