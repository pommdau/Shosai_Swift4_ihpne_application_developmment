//
//  ViewController.swift
//  uiTextField_returnKey
//
//  Created by yoshiyuki oshige on 2017/08/10.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var myTextField: UITextField!
    
    // テキストフィールドのプロパティ宣言
    override func viewDidLoad() {
        super.viewDidLoad()
        // myTextFieldのデリゲートになる
        myTextField.delegate = self
    }
    
    // 改行が入力された（デリゲートメソッド）
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを下げる
        view.endEditing(true)
        return false // 改行は入力しない
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



