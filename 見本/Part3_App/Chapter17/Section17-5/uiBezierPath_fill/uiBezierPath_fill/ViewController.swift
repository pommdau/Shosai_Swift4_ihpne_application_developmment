//
//  ViewController.swift
//  uiBezierPath_fill
//
//  Created by yoshiyuki oshige on 2017/08/25.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func drawPathImage() -> UIImage {
        // イメージ処理の開始
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        UIColor.lightGray.setFill() // 塗り色
        
        // 四角形のパス（閉じた図形）
        let boxRect = CGRect(x: 100, y: 100, width: 150, height: 100)
        let boxPath = UIBezierPath(rect: boxRect)
        boxPath.lineWidth = 2
        boxPath.fill()  // 塗る
        boxPath.stroke()
        
        // ベジェ曲線のパス（開いた図形）
        let curvePath = UIBezierPath()
        let pt0 = CGPoint(x: 80, y: 300)
        let pt1 = CGPoint(x: 300, y: 500)
        let cPt1 = CGPoint(x: 400, y: 300)
        let cPt2 = CGPoint(x: 100, y: 600)
        curvePath.move(to: pt0)
        curvePath.addCurve(to: pt1 , controlPoint1: cPt1 , controlPoint2: cPt2)
        curvePath.lineWidth = 2
        curvePath.fill() // 塗る
        curvePath.stroke()
        
        // イメージコンテキストからUIImageを作る
        let image = UIGraphicsGetImageFromCurrentImageContext()
        // イメージ処理の終了
        UIGraphicsEndImageContext()
        return image!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 図形のイメージを作る
        let drawImage = drawPathImage()
        // イメージビューに設定する
        let drawView = UIImageView(image: drawImage)
        // 画面に表示する
        view.addSubview(drawView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

