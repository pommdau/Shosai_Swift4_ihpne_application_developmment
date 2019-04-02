//
//  ViewController.swift
//  addGestureRecognizer_tap
//
//  Created by yoshiyuki oshige on 2017/08/23.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hello()を実行するタップジェスチャーレコグナイザ
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(self.hello(_:)))
        // ビューを作る
        let myView = UIView(frame: CGRect(x: 100, y: 100, width: 80, height: 80))
        myView.backgroundColor = UIColor.green
        // tagに番号を付ける
        myView.tag = 1
        
        // ビューにタップジェスチャーレコグナイザを追加する
        myView.addGestureRecognizer(tapGesture)
        view.addSubview(myView)
    }
    
    // タップジェスチャーレコグナイザで実行するメソッド
    @objc func hello(_ sender:UITapGestureRecognizer) {
        // tagの番号を調べる
        let tagNo = sender.view?.tag
        print("ハロー", tagNo!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

