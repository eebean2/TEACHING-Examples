//
//  ViewController.swift
//  iossample
//
//  Created by Erik Bean on 2/1/19.
//  Copyright © 2019 Brick Water Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var outgoingImage: UIImage?

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next" {
            let vc = segue.destination as! ViewControllerTwo
            vc.incomingImage = outgoingImage
        }
    }
}

class CustomButton: UIView {
    override func draw(_ rect: CGRect) {
        super .draw(rect)
        layer.cornerRadius = 15
        layer.masksToBounds = true
    }
}
