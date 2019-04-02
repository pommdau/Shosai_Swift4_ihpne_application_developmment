//
//  ViewController.swift
//  uiBezierPath_fillRule
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
        // 四角形のパス
        let boxRect = CGRect(x: 80, y: 200, width: 150, height: 150)
        let boxPath = UIBezierPath(rect: boxRect)
        // 上の円のパス
        let ovalRect1 = CGRect(x: 50, y: 150, width: 150, height: 150)
        let ovalPath1 = UIBezierPath(ovalIn: ovalRect1)
        // 下の円のパス
        let ovalRect2 = CGRect(x: 120, y: 250, width: 150, height: 150)
        let ovalPath2 = UIBezierPath(ovalIn: ovalRect2)
        
        // パスを１つにまとめる
        let drawPath = UIBezierPath()
        drawPath.append(boxPath)
        drawPath.append(ovalPath1)
        drawPath.append(ovalPath2)
        UIColor.red.setFill()
        // 重なりが奇数回の領域は塗らない
        drawPath.usesEvenOddFillRule = true
        drawPath.fill()
        // イメージコンテキストからUIImage を作る
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

