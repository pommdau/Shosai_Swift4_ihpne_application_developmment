//
//  ViewController.swift
//  uiBezierPath_arc
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
        let arcPath = UIBezierPath(
            arcCenter: CGPoint(x: view.center.x, y: 200),
            radius: 80.0,
            startAngle: 0.0,
            endAngle: CGFloat(Double.pi*5/3),
            clockwise: true // 時計回り
        )
        arcPath.lineWidth = 40
        arcPath.lineCapStyle = .round
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

