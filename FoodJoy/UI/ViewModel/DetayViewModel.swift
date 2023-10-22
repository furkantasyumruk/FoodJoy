//
//  DetayViewModel.swift
//  FoodJoy
//
//  Created by Furkan Taşyumruk on 20.10.2023.
//

import Foundation

class DetayViewModel {
    
    var yrepo = YemeklerDaoRepository()
    
    func sepeteYemekEkle(yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:Int, yemek_siparis_adet:Int, kullanici_adi:String){
        yrepo.sepeteYemekEkle(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: "damla_kirik")
        
    }
    
}
