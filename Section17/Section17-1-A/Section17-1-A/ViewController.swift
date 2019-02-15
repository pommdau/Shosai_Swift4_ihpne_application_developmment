//
//  ViewController.swift
//  Section17-1-A
//
//  Created by Hiroki Ikeuchi on 2019/02/15.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func makeBoxImage(width w:CGFloat, height h:CGFloat) -> UIImage {
        let size = CGSize(width: w, height: h)
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        let context = UIGraphicsGetCurrentContext()
        
        // サイズを決める
        let drawRect = CGRect(x: 0, y: 0, width: w, height: h)
        // パスを作る
        let drawPath = UIBezierPath(rect: drawRect)
        
        // 塗り色
        context?.setFillColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
        // パスを塗る
        drawPath.fill()
        // 線の色
        context?.setStrokeColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        // パスを書く
        drawPath.stroke()
        // イメージコンテキストからUIImageを作る
        let image = UIGraphicsGetImageFromCurrentImageContext()
        // イメージ処理の終了
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    // 角丸四角形のパスを作る
    func makeBoundRectImage(width w:CGFloat, height h:CGFloat, corner r:CGFloat) -> UIImage {
        // イメージ処理の開始
        let size = CGSize(width: w, height: h)
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        let context = UIGraphicsGetCurrentContext()
        
        // 角丸四角形の描画
        let drawRect = CGRect(x: 0, y: 0, width: w, height: h)
        let drawPath = UIBezierPath(roundedRect: drawRect, cornerRadius: r)
        // パスを塗る
        context?.setFillColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
        drawPath.fill()
        // パスを書く
        context?.setStrokeColor(red: 1.0, green: 0, blue: 0, alpha: 1.0)
        drawPath.stroke()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        // 四角形のイメージを作る
//        let boxImage = makeBoxImage(width: 240, height: 180)
//        // イメージビューに設定する
//        let boxView = UIImageView(image: boxImage)
//        // 画面に表示する
//        boxView.center = view.center
//        view.addSubview(boxView)
        
        // 角丸四角形のイメージを作る
        let roundedBoxImage = makeBoundRectImage(width: 240, height: 180, corner: 20)
        // イメージビューに設定する
        let roundedBoxView = UIImageView(image: roundedBoxImage)
        // 画面に表示する
        roundedBoxView.center = view.center
        view.addSubview(roundedBoxView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

