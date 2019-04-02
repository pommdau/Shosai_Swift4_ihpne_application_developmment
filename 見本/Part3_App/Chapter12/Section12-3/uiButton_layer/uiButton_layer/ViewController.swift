//
//  ViewController.swift
//  uiButton_layer
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
    
    // ボタンを作って表示する
    func addButton() {
        let myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 50))
        // 赤い角丸四角形を描く
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.backgroundColor = UIColor.red
        myButton.setTitle("ハロー", for: .normal)
        // 画面の下の中央に表示する
        myButton.layer.position = CGPoint(x: view.bounds.width/2, y:view.bounds.height-50)
        // タップでhello()を実行する
        myButton.addTarget(self, action: #selector(ViewController.hello(_:)), for: .touchUpInside)
        // ボタンをViewに追加する
        view.addSubview(myButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ボタンを作る
        addButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


