//
//  ViewController.swift
//  Section16-3
//
//  Created by Hiroki Ikeuchi on 2019/02/14.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tombo: UIImageView!
    
    // 最後の回転角度
    var lastRotation:CGFloat = 0.0
    
    @IBAction func rotateTombo(_ sender: UIRotationGestureRecognizer) {
        switch sender.state {
        case .began:
            sender.rotation = lastRotation
        case .changed:
            tombo.transform = CGAffineTransform(rotationAngle: sender.rotation)
        case .ended:
            lastRotation = sender.rotation
        default:
            break
        }
        
        
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

