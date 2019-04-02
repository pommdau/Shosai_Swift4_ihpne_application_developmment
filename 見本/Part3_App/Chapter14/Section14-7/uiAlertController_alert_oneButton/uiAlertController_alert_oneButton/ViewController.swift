//
//  ViewController.swift
//  uiAlertController_alert_oneButton
//
//  Created by yoshiyuki oshige on 2017/08/22.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func showAlert(_ sender: Any) {
        // アラートを作る
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alert.title = "タイトル"
        alert.message = "メッセージ文"
        
        // ボタン1
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: {(action) -> Void in
                    self.hello(action.title!)
            })
        )
        
        // アラートを表示する
        self.present(
            alert,
            animated: true,
            completion: {
                // 表示完了後に実行
                print("アラートが表示された")
        }
        )
    }
    
    // 選択で実行するメソッド
    func hello(_ msg:String) {
        print(msg)
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

