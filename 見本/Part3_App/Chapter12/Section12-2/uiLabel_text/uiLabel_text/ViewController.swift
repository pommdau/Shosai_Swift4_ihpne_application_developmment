//
//  ViewController.swift
//  uiLabel_text
//
//  Created by yoshiyuki oshige on 2017/08/07.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // ラベルのプロパティ宣言
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myLabel3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 単価と個数
        let tanka = 120
        let kosu = 4
        // ラベルに表示する
        myLabel1.text = "単価\(tanka)、\(kosu)個"
        myLabel2.text = String(tanka*kosu)
        myLabel3.text = "金額" + myLabel2.text! + "円"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

