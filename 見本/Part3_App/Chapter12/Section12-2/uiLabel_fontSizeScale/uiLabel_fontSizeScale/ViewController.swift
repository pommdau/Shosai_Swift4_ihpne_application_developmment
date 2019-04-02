//
//  ViewController.swift
//  uiLabel_fontSizeScale
//
//  Created by yoshiyuki oshige on 2017/08/08.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myLabel3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textdata = "詳細!Swift iOSアプリ開発入門ノート"
        // サイズ固定で表示する
        myLabel1.text = textdata
        
        // すべて表示できるように文字サイズを縮小する
        myLabel2.adjustsFontSizeToFitWidth = true
        myLabel2.text = textdata
        
        // 文字サイズを最小で60%までは縮小する
        myLabel3.adjustsFontSizeToFitWidth = true
        myLabel3.minimumScaleFactor = 0.6
        myLabel3.text = textdata
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

