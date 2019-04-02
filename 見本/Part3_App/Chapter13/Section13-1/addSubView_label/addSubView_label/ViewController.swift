//
//  ViewController.swift
//  addSubView_label
//
//  Created by yoshiyuki oshige on 2017/06/29.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ラベルを作る
        let labelA = UILabel()
        labelA.text = "ラベルA"
        // ラベルの領域
        labelA.frame = CGRect(x: 80, y: 150, width: 110, height: 21)
        // 背景色と文字色
        labelA.backgroundColor = UIColor.orange
        labelA.textColor = UIColor.white
        
        // ルートビューに追加する
        self.view.addSubview(labelA)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

