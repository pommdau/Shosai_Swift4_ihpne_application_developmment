//
//  ViewController.swift
//  uiBezierPath_ovalIn
//
//  Created by yoshiyuki oshige on 2017/08/24.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 楕円形の図形イメージを作る
    func makeOvalImage(witdh w:CGFloat, height h:CGFloat) -> UIImage {
        // イメージ処理の開始
        let size = CGSize(width: w, height: h)
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        // コンテキスト
        let context = UIGraphicsGetCurrentContext()
        
        // サイズを決める
        let ovalRect = CGRect(x: 0, y: 0, width: w, height: h)
        // パスを作る
        let drawPath = UIBezierPath(ovalIn: ovalRect)
        // 塗り色
        context?.setFillColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
        // パスを塗る
        drawPath.fill()
        
        // イメージコンテキストからUIImageを作る
        let image = UIGraphicsGetImageFromCurrentImageContext()
        // イメージ処理の終了
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 楕円形のイメージを作る
        let drawImage = makeOvalImage(witdh: 200, height: 150)
        // イメージビューに設定する
        let drawView = UIImageView(image: drawImage)
        // 画面に表示する
        drawView.center = view.center
        view.addSubview(drawView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

