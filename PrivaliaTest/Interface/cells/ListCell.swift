//
//  ListCell.swift
//  PrivaliaTest
//
//  Created by Alejandro Palomo Rodriguez on 18/1/18.
//  Copyright © 2018 Alejandro Palomo Rodriguez. All rights reserved.
//

import UIKit
import SDWebImage

class ListCell: UITableViewCell {

    @IBOutlet var imgFilm: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblDescription: UILabel!
    static let url = "https://image.tmdb.org/t/p/w500"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imgFilm.layer.borderWidth = 1
        self.imgFilm.layer.masksToBounds = false
        self.imgFilm.layer.borderColor = UIColor.black.cgColor
        self.imgFilm.layer.cornerRadius = self.imgFilm.frame.height/2
        self.imgFilm.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImage(imageUrl:String){
        self.imgFilm.sd_setImage(with: URL(string:ListCell.url+imageUrl), placeholderImage: UIImage(named: ""))
    }
    
}
