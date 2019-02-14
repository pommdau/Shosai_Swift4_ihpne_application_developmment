//
//  ViewController.swift
//  animation_transform_alpha
//
//  Created by Hiroki Ikeuchi on 2019/02/13.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        // make flower
        let flower   = UIImageView(image: UIImage(named: "flower"))
        flower.alpha = 0
        
        let scaleTransform    = CGAffineTransform(scaleX: 0.2, y:0.2)
        let rotationTransform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
        let transform         = scaleTransform.concatenating(rotationTransform)
        flower.transform = transform
        
        // tap and add flower
        flower.center = sender.location(in: self.view)
        view.addSubview(flower)
        
        // animation
        UIView.animate(
            withDuration: 1.0,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                flower.alpha = 1.0
                // 変形を戻す
                flower.transform = .identity
        },
            completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

