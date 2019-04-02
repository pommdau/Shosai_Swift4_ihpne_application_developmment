//
//  ViewController.swift
//  action_connection
//
//  Created by yoshiyuki oshige on 2017/08/07.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // ラベルを指し示すプロパティ
    @IBOutlet weak var myLabel: UILabel!
    
    // helloボタンをタップすると実行されるメソッド
    @IBAction func hello(_ sender: Any) {
        myLabel.text = "こんにちは"
    }
    
    // thank youボタンをタップすると実行されるメソッド
    @IBAction func thankYou(_ sender: Any) {
        myLabel.text = "ありがとう"
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

