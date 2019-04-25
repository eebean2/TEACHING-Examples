//
//  ViewController.swift
//  ImageSample
//
//  Created by Erik Bean on 1/18/19.
//  Copyright © 2019 Brick Water Studios. All rights reserved.
//

import UIKit

let identifier = "Identifier"

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 16 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ViewCell
        if indexPath.row == 17 {
            cell.imageView!.image = UIImage(named: "eye.png")
        } else {
            cell.imageView!.image = UIImage(named: "icon.png")
        }
        return cell
    }
    


}

class ViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.borderColor = hexStringToUIColor(hex: "#F3E9D2").cgColor
    }
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
