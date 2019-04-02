//
//  ViewController.swift
//  userDefaults_Float
//
//  Created by yoshiyuki oshige on 2017/08/27.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // スライダとラベルをOutlet接続する
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    // プログレスバーとラベルをOutlet接続する
    @IBOutlet weak var myProgress: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    
    // ユーザーデフォルトに保存する
    @IBAction func saveValue(_ sender: Any) {
        // ユーザーデフォルトを参照する
        let defaults = UserDefaults.standard
        let value = mySlider.value
        // ラベルに値を表示する
        sliderLabel.text = String(value)
        // キー"sliderValue"で値を保存する
        defaults.set(value, forKey: "sliderValue")
    }
    
    // ユーザーデフォルトから読み込む
    @IBAction func readValue(_ sender: Any) {
        // ユーザーデフォルトを参照する
        let defaults = UserDefaults.standard
        // キー"sliderValue"をFloatとして値を読み込む
        let value = defaults.float(forKey: "sliderValue")
        // ラベルに値を表示する
        progressLabel.text = String(value)
        // プログレスバーに値を設定する
        myProgress.progress = value
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

