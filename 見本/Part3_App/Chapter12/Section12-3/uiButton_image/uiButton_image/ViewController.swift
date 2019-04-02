//
//  ViewController.swift
//  uiButton_image
//
//  Created by yoshiyuki oshige on 2017/08/08.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // ボタンで実行するメソッド
    @objc func hello(_ sender:UIButton) {
        print("ハロー")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // カスタムタイプのボタンを作る
        let myButton = UIButton(type: .custom)
        // 領域
        myButton.frame = CGRect(x: 50, y: 100, width: 120, height: 50)
        // ボタンの画像
        let image1 = UIImage(named: "btnNormal")
        let image2 = UIImage(named: "btnHighlighted")
        myButton.setImage(image1, for: .normal)
        myButton.setImage(image2, for: .highlighted)
        // タイトル
        myButton.setTitle("Hello", for: .normal)
        myButton.setTitleColor(UIColor.black, for: .normal)
        // ボタンで実行するメソッド
        myButton.addTarget(self, action: #selector(ViewController.hello(_:)), for: UIControlEvents.touchUpInside)
        // ビューに追加する
        self.view.addSubview(myButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


