//
//  ViewController.swift
//  uiImageView_image
//
//  Created by yoshiyuki oshige on 2017/08/12.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 画面の背景色をグレーにする
        self.view.backgroundColor = UIColor.lightGray
        
        // イメージビューを作る
        let rect = CGRect(x: 0, y: 0, width: 300, height: 200)
        let imageView = UIImageView(frame: rect)
        // イメージの表示モード
        imageView.contentMode = .scaleAspectFit
        // イメージビューにイメージを設定する
        imageView.image = UIImage(named: "sheep.jpg")
        // イメージビューの座標をルートビューの中央に設定する
        imageView.center = self.view.center
        // イメージビューをルートビューに追加（表示）する
        self.view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

