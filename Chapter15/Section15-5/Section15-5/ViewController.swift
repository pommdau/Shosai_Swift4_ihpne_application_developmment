//
//  ViewController.swift
//  Section15-5
//
//  Created by Hiroki Ikeuchi on 2019/02/14.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var boyView: UIImageView!
    @IBOutlet weak var mySlider: UISlider!
    
    @IBAction func runSpeed(_ sender: UISlider) {
        if sender.value == 0 {
            boyView.stopAnimating()
            boyView.image = UIImage(named: "jogboy_0")
        } else {
            let sec = sender.maximumValue - sender.value
            boyView.animationDuration = TimeInterval(sec)
            if !boyView.isAnimating {
                boyView.startAnimating()
            }
            
        }
    }
    
    // コマ送りのイメージ配列を作る
    func jogboyImages () -> Array<UIImage> {
        var theArray = Array<UIImage>()
        for num in 1...10 {
            let imageName = "jogboy_" + String(num)
            let image = UIImage(named: imageName)
            theArray.append(image!)
        }
        return theArray
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mySlider.minimumValue = 0.0
        mySlider.maximumValue = 5.0
        mySlider.value = 0.0
        boyView.animationImages = jogboyImages()
        boyView.animationRepeatCount = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

