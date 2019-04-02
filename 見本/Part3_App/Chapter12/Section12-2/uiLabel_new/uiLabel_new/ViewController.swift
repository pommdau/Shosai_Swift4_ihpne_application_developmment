//
//  ViewController.swift
//  uiLabel_new
//
//  Created by yoshiyuki oshige on 2017/08/08.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ラベルを作成する
        let myLabel = UILabel()
        myLabel.text = "ハローワールド"
        
        // ラベルの領域
        myLabel.frame = CGRect(x: 50, y: 100, width: 200, height: 21)
        
        // 文字色と背景色
        myLabel.textColor = UIColor.black
        myLabel.backgroundColor = UIColor.lightGray
        
        // ビューに追加する
        view.addSubview(myLabel)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

