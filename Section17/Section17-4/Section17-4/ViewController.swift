//
//  ViewController.swift
//  Section17-4
//
//  Created by Hiroki Ikeuchi on 2019/02/17.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func drawLine() -> UIImage {
        // points for first image
        let a = CGPoint(x: 50, y: 70)
        let b = CGPoint(x: 250, y: 100)
        let c = CGPoint(x: 120, y: 200)
        // points for second image
        let d = CGPoint(x: 50, y: 300)
        let e = CGPoint(x: 250, y: 300)
        let f = CGPoint(x: 250, y: 500)
        let g = CGPoint(x: 100, y: 550)
        
        // イメージ処理の開始
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        // 補助線を引く
        UIColor.black.setStroke()
        let linePath = UIBezierPath()
        // 直線のパスを追加していく
        linePath.append(makeLinePath(a, b))
        linePath.append(makeLinePath(b, c))
        linePath.append(makeLinePath(d, e))
        linePath.append(makeLinePath(f, g))
        linePath.lineWidth = 1.0
        // 点線で書く
        linePath.setLineDash([2.0, 2.0], count: 2, phase: 0.0)
        linePath.stroke()
        
        // ベジェ曲線1を描く
        UIColor.red.setStroke()
        let curvePath1 = UIBezierPath()
        // 始点へ移動
        curvePath1.move(to: a)
        // コントロールポイントが1個のベジェ曲線
        curvePath1.addQuadCurve(to: c, controlPoint: b)
        curvePath1.lineWidth = 2
        curvePath1.stroke()
        
        // ベジェ曲線2を描く
        UIColor.blue.setStroke()
        let curvePath2 = UIBezierPath()
        // 始点へ移動
        curvePath2.move(to: d)
        // コントロールポイントが2個のベジェ曲線
        curvePath2.addCurve(to: f, controlPoint1: e, controlPoint2: g)
        curvePath2.lineWidth = 2
        curvePath2.stroke()
        
        // イメージコンテキストからUIImageを作る
        let image = UIGraphicsGetImageFromCurrentImageContext()
        // イメージ処理の酋長
        UIGraphicsEndImageContext()
        return image!
    }
    // 直線のパスを作る関数
    func makeLinePath(_ startPoint:CGPoint, _ endPoint:CGPoint) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        return path
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let drawImage = drawLine()
        let drawView = UIImageView(image: drawImage)
        view.addSubview(drawView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

