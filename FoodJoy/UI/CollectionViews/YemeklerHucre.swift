//
//  YemeklerHucre.swift
//  FoodJoy
//
//  Created by Furkan Taşyumruk on 20.10.2023.
//

import UIKit

protocol HucreProtocol {
    func sepeteEkleTikla(indexPath:IndexPath)
}

class YemeklerHucre: UICollectionViewCell {
    
    @IBOutlet weak var imageViewYemek: UIImageView!
    @IBOutlet weak var buttonHeart: UIButton!
    
    @IBOutlet weak var labelFiyat: UILabel!
    @IBOutlet weak var labelisim: UILabel!
    
    var hucreProtocol:HucreProtocol?
    var indexPath:IndexPath?
    var isSecim = false
    
    @IBAction func buttonHeart(_ sender: Any) {
        isSecim.toggle() // Durumu tersine çevir
        
        if isSecim {
            buttonHeart.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            print("secim : \(isSecim)")
        } else {
            buttonHeart.setImage(UIImage(systemName: "heart"), for: .normal)
            print("secim : \(isSecim)")
        }
    }
}
