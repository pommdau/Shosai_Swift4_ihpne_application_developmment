//
//  ViewController.swift
//  uiAlertController_alert
//
//  Created by yoshiyuki oshige on 2017/06/29.
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
                title: "ボタン１です",
                style: .default,
                handler: {(action) -> Void in
                    self.hello(action.title!)
            })
        )
        
        // ボタン２
        alert.addAction(
            UIAlertAction(
                title: "ボタン２です",
                style: .default,
                handler: {(action) -> Void  in
                    self.hello(action.title!)
            })
        )
        
        // キャンセル（追加順にかかわらず最後に表示される）
        alert.addAction(
            UIAlertAction(
                title: "キャンセル",
                style: .cancel,
                handler: nil)
        )
        
        
        // 赤色のボタン
        alert.addAction(
            UIAlertAction(
                title: "削除します",
                style: .destructive,
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

