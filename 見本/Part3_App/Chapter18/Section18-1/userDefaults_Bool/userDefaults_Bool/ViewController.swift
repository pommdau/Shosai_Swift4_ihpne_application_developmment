//
//  ViewController.swift
//  userDefaults_Bool
//
//  Created by yoshiyuki oshige on 2017/08/27.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // スイッチをOutlet接続する
    @IBOutlet weak var mySwitch1: UISwitch!
    @IBOutlet weak var mySwitch2: UISwitch!
    
    // ユーザーデフォルトに保存する
    @IBAction func saveStatus(_ sender: Any) {
        // ユーザーデフォルトを参照する
        let defaults = UserDefaults.standard
        // mySwitch1の値をキー"switchOn"で保存する
        defaults.set(mySwitch1.isOn, forKey: "switchOn")
    }
    
    // ユーザーデフォルトから読み込む
    @IBAction func readStatus(_ sender: Any) {
        // ユーザーデフォルトを参照する
        let defaults = UserDefaults.standard
        // キー"switchOn"の値をBoolとして読んでmySwitch2に設定する
        mySwitch2.isOn = defaults.bool(forKey: "switchOn")
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

