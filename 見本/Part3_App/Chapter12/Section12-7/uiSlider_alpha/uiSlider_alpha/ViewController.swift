//
//  ViewController.swift
//  uiSlider_alpha
//
//  Created by yoshiyuki oshige on 2017/08/09.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 花のプロパティ宣言
    @IBOutlet weak var flower: UIImageView!
    
    // スライダの変化で呼び出すメソッド
    @IBAction func changeSlider(_ sender: UISlider) {
        // アルファ値をスライダの値で設定する
        flower.alpha = CGFloat(sender.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

