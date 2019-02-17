//
//  ViewController.swift
//  Section17-5-B
//
//  Created by Hiroki Ikeuchi on 2019/02/17.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func drawPathImage() -> UIImage {
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        // Rectangle Path
        let boxRect = CGRect(x: 80, y: 200, width: 150, height: 150)
        let boxPath = UIBezierPath(rect: boxRect)
        // Upper Circle Path
        let ovalRect1 = CGRect(x: 50, y: 150, width: 150, height: 150)
        let ovalPath1 = UIBezierPath(ovalIn: ovalRect1)
        // Lower Circle path
        let ovalRect2 = CGRect(x: 120, y: 250, width: 150, height: 150)
        let ovalPath2 = UIBezierPath(ovalIn: ovalRect2)
        
        // unit pathes
        let drawPath = UIBezierPath()
        drawPath.append(boxPath)
        drawPath.append(ovalPath1)
        drawPath.append(ovalPath2)
        
        UIColor.red.setFill()
        // 重なりが奇数回の領域は塗らない
        drawPath.usesEvenOddFillRule = true
        drawPath.fill()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let drawImage = drawPathImage()
        let drawView = UIImageView(image: drawImage)
        view.addSubview(drawView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

