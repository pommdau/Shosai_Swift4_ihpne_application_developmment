//
//  ViewController.swift
//  addSubView_label2
//
//  Created by yoshiyuki oshige on 2017/08/12.
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
        let xy = CGPoint(x: 80, y: 150)
        let wh = CGSize(width: 110, height: 21)
        labelA.frame = CGRect(origin: xy, size: wh)
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

