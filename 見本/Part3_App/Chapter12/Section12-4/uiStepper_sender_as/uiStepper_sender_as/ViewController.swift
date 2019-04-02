//
//  ViewController.swift
//  uiStepper_sender_as
//
//  Created by yoshiyuki oshige on 2017/08/09.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // ラベルのプロパティ宣言
    @IBOutlet weak var numLabel: UILabel!
    
    // ステッパーで呼び出すメソッド
    @IBAction func changedStepperValue(_ sender: Any) {
        
        // UIStepper型にキャストする
        let stepper = sender as! UIStepper
        // ステッパーの値
        let num = Int(stepper.value)
        // ラベルに表示する
        numLabel.text = String(num)
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

