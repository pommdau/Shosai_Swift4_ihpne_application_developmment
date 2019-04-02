//
//  ViewController.swift
//  uiTextField_delegate_fix
//
//  Created by yoshiyuki oshige on 2017/08/09.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // テキストフィールドのプロパティ宣言
    @IBOutlet weak var myTextField: UITextField!
    // ラベルのプロパティ宣言
    @IBOutlet weak var myLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // myTextFieldのデリゲートになる
        myTextField.delegate = self
        
    }
    
    // テキストフィールドの値が編集中に変更される度に実行される
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 変更後の内容を作成する
        let tmpStr = textField.text! as NSString
        let replacedString = tmpStr.replacingCharacters(in: range, with: string)
        if replacedString == "" {
            // 変更後が空ならばラベルに 0 を表示する
            myLabel.text = "0"
        } else {
            // 変更後の値を計算してラベルに表示する（25を掛けた値）
            if let num = Int(replacedString) {
                myLabel.text = String(num * 25)
            }
            
        }
        // テキストフィールドを更新する
        return true
    }
    
    // クリアボタンで実行されるデリゲートメソッド
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        myLabel.text = "0"
        return true
    }
    
    // 画面タップでキーボードを下げる
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        // 編集終了でキーボードを下げる
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


