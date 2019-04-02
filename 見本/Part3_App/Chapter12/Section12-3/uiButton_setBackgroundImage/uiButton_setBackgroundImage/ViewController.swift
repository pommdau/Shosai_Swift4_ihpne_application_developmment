//
//  ViewController.swift
//  uiButton_setBackgroundImage
//
//  Created by yoshiyuki oshige on 2017/08/08.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // ボタンで実行するメソッド
    @objc func ok(_ sender:UIButton) {
        print("OK")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ボタンを作る
        let okButton = UIButton()
        // 領域
        okButton.frame = CGRect(x: 100, y: 100, width: 120, height: 120)
        // 背景画像
        let bkgImage = UIImage(named: "maru")
        okButton.setBackgroundImage(bkgImage, for: .normal)
        // タイトル
        okButton.setTitle("OK", for: .normal)
        okButton.setTitleColor(UIColor.black, for: .normal)
        // ボタンで実行するメソッド
        okButton.addTarget(self, action: #selector(ViewController.ok(_:)), for: UIControlEvents.touchUpInside)
        // ビューに追加する
        view.addSubview(okButton)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}




