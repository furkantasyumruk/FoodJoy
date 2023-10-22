//
//  Favoriler.swift
//  FoodJoy
//
//  Created by Furkan Taşyumruk on 20.10.2023.
//

import Foundation

class Favoriler{
    
    
    var id:Int?
    var ad:String?
    var resim:String?
    
    init(){
        
    }
  
    
    init(id: Int?, ad: String?, resim: String?) {
        self.id = id
        self.ad = ad
        self.resim = resim
    }
    
}
