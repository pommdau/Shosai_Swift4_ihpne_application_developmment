//
//  ViewController.swift
//  uiBezierPath_closePath
//
//  Created by yoshiyuki oshige on 2017/08/24.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func drawLine() -> UIImage {
        // イメージ処理の開始
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        // 円弧のパスを作る
        let center = CGPoint(x: view.center.x, y: 200)
        let arcPath = UIBezierPath(
            arcCenter: center,
            radius: 80.0,
            startAngle: CGFloat(-Double.pi/2),
            endAngle: CGFloat(Double.pi/4*3),
            clockwise: true // 時計回り
        )
        // 中心まで直線のパスを追加する
        arcPath.addLine(to: center)
        // パスを閉じる
        arcPath.close()
        
        // パスを塗る
        UIColor.cyan.setFill()
        arcPath.fill()
        // パスを描く
        arcPath.lineWidth = 5
        arcPath.lineCapStyle = .butt
        arcPath.stroke()
        
        // イメージコンテキストからUIImageを作る
        let image = UIGraphicsGetImageFromCurrentImageContext()
        // イメージ処理の終了
        UIGraphicsEndImageContext()
        return image!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 図形のイメージを作る
        let drawImage = drawLine()
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

