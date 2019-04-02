//
//  ViewController.swift
//  uiLabel_color
//
//  Created by yoshiyuki oshige on 2017/08/08.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 正または負の値でテストしてみる
//        myLabel.text = "10.2"
        myLabel.text = "-1.5"
        
        // myLabelに入っている数値
        guard let num = Double(myLabel.text!) else {
            return
        }
        
        // 文字色と背景色の設定
        if num >= 0.0 {
            myLabel.textColor = UIColor.black
            myLabel.backgroundColor = UIColor.white
        } else {
            myLabel.textColor = UIColor.white
            myLabel.backgroundColor = UIColor.red
        }
        
    }

}

