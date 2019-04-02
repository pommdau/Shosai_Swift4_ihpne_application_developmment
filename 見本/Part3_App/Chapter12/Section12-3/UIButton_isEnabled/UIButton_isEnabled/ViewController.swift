//
//  ViewController.swift
//  UIButton_isEnabled
//
//  Created by yoshiyuki oshige on 2017/10/20.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // ラベルとOKボタンをOutlet接続する
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    // Randomボタンで乱数を作る
    @IBAction func random(_ sender: Any) {
        // 乱数を作る
        let num = arc4random_uniform(100)
        numLabel.text = String(num)
        
        // numが50以上のときOKボタンを有効にする
        // 50未満のときは無効にする
        okButton.isEnabled = (num>=50)
    }
    
    // OKボタンで実行するメソッド
    @IBAction func tapOK(_ sender: Any) {
        print("OK")
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

