//
//  ViewController.swift
//  uiBezierPath_rect
//
//  Created by yoshiyuki oshige on 2017/08/24.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 四角形の図形イメージを作る
    func makeBoxImage(witdh w:CGFloat, height h:CGFloat) -> UIImage {
        // 描画サイズ
        let size = CGSize(width: w, height: h)
        // 描画の開始
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        // コンテキスト
        let context = UIGraphicsGetCurrentContext()
        
        // サイズを決める
        let drawRect = CGRect(x: 0, y: 0, width: w, height: h)
        // パスを作る（四角形）
        let drawPath = UIBezierPath(rect: drawRect)
        
        // 塗り色
        context?.setFillColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
        // パスを塗る
        drawPath.fill()
        // 線の色
        context?.setStrokeColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        // パスを描く
        drawPath.stroke()
        
        // イメージコンテキストからUIImageを作る
        let image = UIGraphicsGetImageFromCurrentImageContext()
        // イメージ処理の終了
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 四角形のイメージを作る
        let boxImage = makeBoxImage(witdh: 200, height: 150)
        // イメージビューに設定する
        let boxView = UIImageView(image: boxImage)
        // 画面に表示する
        boxView.center = view.center
        view.addSubview(boxView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

