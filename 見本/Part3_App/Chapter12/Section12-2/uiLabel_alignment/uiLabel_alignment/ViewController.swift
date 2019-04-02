//
//  ViewController.swift
//  uiLabel_alignment
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
        // 文字揃えを設定
        myLabel1.textAlignment = .left
        myLabel2.textAlignment = .center
        myLabel3.textAlignment = .right
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

