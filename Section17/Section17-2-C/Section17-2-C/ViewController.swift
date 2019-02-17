//
//  ViewController.swift
//  Section17-2-C
//
//  Created by Hiroki Ikeuchi on 2019/02/17.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // パーセントの円弧のパスを作る
    func arcPercent(_ radius:CGFloat, _ percent:Double) -> UIBezierPath {
        let endAngle = 2*Double.pi*percent/100 - Double.pi/2
        let path = UIBezierPath(
            arcCenter: CGPoint(x: 0, y: 0),
            radius: radius,
            startAngle: CGFloat(-Double.pi/2),
            endAngle: CGFloat(endAngle),
            clockwise: percent>0
        )
        return path
    }
    
    func drawLine() -> UIImage {
        // イメージ処理の開始
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        let percent = 58.2
        // 円弧のパスを作る
        UIColor.red.setStroke()
        let arcPath = arcPercent(80, percent)
        arcPath.lineWidth = 60
        arcPath.lineCapStyle = .butt
        // パスを並行移動する
        let tf = CGAffineTransform(translationX: view.center.x, y: view.center.y)
        arcPath.apply(tf)
        arcPath.stroke()
        
        // [x%]の数字を書く
        let font = UIFont.boldSystemFont(ofSize: 28)
        let textFontAttributes = [NSAttributedStringKey.font: font,
                                  NSAttributedStringKey.foregroundColor: UIColor.gray]
        let drawString = String(percent) + "%"
        
        let posX = view.center.x - 45
        let posY = view.center.y - 15
        let rect = CGRect(x: posX, y: posY, width: 90, height: 30)
        drawString.draw(in: rect, withAttributes: textFontAttributes)   // テキストを書く
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
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

