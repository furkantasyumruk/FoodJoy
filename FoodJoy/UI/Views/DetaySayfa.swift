//
//  DetaySayfa.swift
//  FoodJoy
//
//  Created by Furkan Taşyumruk on 20.10.2023.
//

import UIKit

class DetaySayfa: UIViewController {

    @IBOutlet weak var labelYemek: UILabel!
    @IBOutlet weak var labelUrunSayac: UILabel!
    @IBOutlet weak var labelToplamFiyat: UILabel!
    @IBOutlet weak var labelFiyat: UILabel!
    @IBOutlet weak var imageViewYemek: UIImageView!
    @IBOutlet weak var labelBilgiOne: UILabel!
    @IBOutlet weak var labelBilgiTwo: UILabel!
    @IBOutlet weak var labelBilgiTheree: UILabel!
    
    
    var yemek:Yemekler?
    var sepetYemekler:SepetYemekler?
    var urunFiyati: Int?
    
    var viewModel = DetayViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let y = yemek, let fiyatString = y.yemek_fiyat {
            labelFiyat.text = "\(fiyatString) ₺"
            labelToplamFiyat.text = "\(fiyatString) ₺"
            urunFiyati = Int(fiyatString)
        }
        
        
        
        if let y = sepetYemekler {
            labelYemek.text = y.yemek_adi
            labelFiyat.text = y.yemek_fiyat
            
            
            if let yemekResimAdi = y.yemek_resim_adi, let image = UIImage(named: yemekResimAdi){
                imageViewYemek.image = image
            }else{
                imageViewYemek.image = UIImage(named: "su")
            }
        }
        
        if let y = yemek {
            labelYemek.text = y.yemek_resim_adi
            
            if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(y.yemek_resim_adi!)"){
                DispatchQueue.main.async {
                    self.imageViewYemek.kf.setImage(with: url)
                    
                    if let yemek_adi = self.labelYemek.text, yemek_adi.count >= 4 {
                        let endIndex = yemek_adi.index(yemek_adi.endIndex, offsetBy: -4)
                        let truncatedText = yemek_adi[..<endIndex]
                        let firstChar = truncatedText.prefix(1).uppercased()
                        let restOfText = truncatedText.dropFirst()
                        let formattedText = firstChar + restOfText
                        self.labelYemek.text = String(formattedText)
                    }
                }
            }
          
            
        }
        
        let labelsToRound: [UILabel] = [labelToplamFiyat, labelBilgiOne, labelBilgiTwo, labelBilgiTheree, labelUrunSayac]
        for label in labelsToRound {
            label.layer.cornerRadius = 1
            label.layer.masksToBounds = true
        }
        
       
    }
    
    var urunAdeti = 1
    var urunSayac = 0



    @IBAction func buttonMinus(_ sender: Any) {
        if urunSayac > 0 {
            urunSayac -= 1
            urunAdeti -= 1
            updateLabel()
            hesaplaVeGuncelle()
        }
        
    }
    @IBAction func buttonPlus(_ sender: Any) {
        urunSayac += 1
        urunAdeti += 1
        updateLabel()
        hesaplaVeGuncelle()
        
    }
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        
        if let ya = labelYemek.text, let yi = imageViewYemek.image, let yad = labelUrunSayac.text {
            if let imageData = yi.pngData() {
                let base64Image = imageData.base64EncodedString()
                viewModel.sepeteYemekEkle(yemek_adi: ya, yemek_resim_adi: base64Image, yemek_fiyat: urunFiyati!, yemek_siparis_adet: Int(yad) ?? 1, kullanici_adi: "damla_kirik")
            }
            print("Sepete Eklendi")
        }
    }
    
    func updateLabel() {
        labelUrunSayac.text = "\(urunSayac)"
    }
    
    func hesaplaVeGuncelle() {
        
        if let yemek = yemek, let fiyatString = yemek.yemek_fiyat, let fiyat = Int(fiyatString) {
            let toplamFiyat = fiyat * urunAdeti
            
            if urunAdeti == 1 {
                labelToplamFiyat.text = "\(fiyat) ₺"
            } else {
                labelToplamFiyat.text = "\(toplamFiyat) ₺"
            }
            
            labelUrunSayac.text = "\(urunAdeti)"
            urunFiyati = toplamFiyat 
        } else {
            
            print("Hatalı yemek fiyatı veya ürün adet değeri girildi.")
        }
    }
}


