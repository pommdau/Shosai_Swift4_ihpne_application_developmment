//
//  ViewController.swift
//  Section17-5-A
//
//  Created by Hiroki Ikeuchi on 2019/02/17.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func drawPathImage() -> UIImage {
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        UIColor.lightGray.setFill()
        
        // 四角形のパス（閉じた図形）
        let boxRect = CGRect(x: 100, y: 100, width: 150, height: 100)
        let boxPath = UIBezierPath(rect: boxRect)
        boxPath.lineWidth = 2
        boxPath.fill()
        boxPath.stroke()
        
        // ベジエ曲線のパス（開いた図形）
        let curvePath = UIBezierPath()
        let pt0 = CGPoint(x: 80, y: 300)
        let pt1 = CGPoint(x: 300, y: 500)
        let cPt1 = CGPoint(x: 400, y: 300)
        let cPt2 = CGPoint(x: 100, y: 600)
        curvePath.move(to: pt0)
        curvePath.addCurve(to: pt1, controlPoint1: cPt1, controlPoint2: cPt2)
        curvePath.lineWidth = 2
        curvePath.fill()
        curvePath.stroke()
        
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

