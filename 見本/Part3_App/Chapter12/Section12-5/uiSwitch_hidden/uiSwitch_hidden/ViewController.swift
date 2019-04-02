//
//  ViewController.swift
//  uiSwitch_hidden
//
//  Created by yoshiyuki oshige on 2017/08/11.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // ラベルのプロパティ宣言
    @IBOutlet weak var msgLabel: UILabel!
    
    // スイッチの切り替えで呼び出すメソッド
    @IBAction func showHide(_ sender: UISwitch) {
        // スイッチのオン／オフとラベルのisHiddenの値を逆にする
        msgLabel.isHidden = !sender.isOn
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

