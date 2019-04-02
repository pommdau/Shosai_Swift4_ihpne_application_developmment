//
//  ViewController.swift
//  addSubView_view_label
//
//  Created by yoshiyuki oshige on 2017/08/12.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ビューを作る
        let theView = UIView()
        // ビューの領域と背景色
        theView.frame = CGRect(x: 60, y: 100, width: 210, height: 200)
        theView.backgroundColor = UIColor(red:0.9, green:0.9, blue:0.6, alpha:1.0)
        
        // ラベルを作る
        let labelB = UILabel()
        labelB.text = "ラベルB"
        // ラベルの領域
        labelB.frame = CGRect(x: 50, y: 60, width: 110, height: 21)
        // 背景色と文字色
        labelB.backgroundColor = UIColor.orange
        labelB.textColor = UIColor.white
        
        // labelB をtheView に追加する
        theView.addSubview(labelB)
        // theView をルートビューに追加する
        self.view.addSubview(theView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

