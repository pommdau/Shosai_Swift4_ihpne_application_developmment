//
//  ViewController.swift
//  view_clipsToBounds
//
//  Created by yoshiyuki oshige on 2017/08/12.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // myViewを作る
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        myView.backgroundColor = UIColor.red
        
        // イメージビューを作る
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.image = UIImage(named: "flower")
        // 画像を縮小して全体を表示する
        imageView.contentMode = .scaleAspectFit
        // myViewの中での座標
        imageView.center = CGPoint(x: 80, y: 80)
        
        // myViewのサブビューにする
        myView.addSubview(imageView)
        // サブビューをクリップして表示する
        myView.clipsToBounds = true
        
        // myViewを画面に表示する
        myView.center = CGPoint(x: 100, y: 100)
        view.addSubview(myView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

