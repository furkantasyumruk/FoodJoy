//
//  SepetHucre.swift
//  FoodJoy
//
//  Created by Furkan Taşyumruk on 20.10.2023.
//

import UIKit

class SepetHucre: UITableViewCell {

    @IBOutlet weak var imageViewYemek: UIImageView!
    @IBOutlet weak var labelYemekAdi: UILabel!
    @IBOutlet weak var labelYemekFiyat: UILabel!
    @IBOutlet weak var labelYemekAdet: UILabel!
    @IBOutlet weak var labelToplamYemekFiyat: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
