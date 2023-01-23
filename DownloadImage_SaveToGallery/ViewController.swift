//
//  ViewController.swift
//  DownloadImage_SaveToGallery
//
//  Created by GOVIND KUMAR on 23/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    let imageUrlArray = [
            "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
            "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
            "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
            "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
            "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
            "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg",
            "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
            "https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_.jpg",
            "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
            "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg"
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func actionOfSavedImages(_ sender: Any){
        for value in imageUrlArray where value != ""{
            self.storeImageIntoPhotoAlbum(imageString: value)
        }
    }
    
    private func storeImageIntoPhotoAlbum(imageString:String){
        DispatchQueue.background(background: {
            // do something in background
            if let url = URL(string: imageString),
               let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            }
        }, completion:{
            // when background job finished, do something in main thread
            self.alert(message: "Image saved successfully in gallery")
        })
    }
}

