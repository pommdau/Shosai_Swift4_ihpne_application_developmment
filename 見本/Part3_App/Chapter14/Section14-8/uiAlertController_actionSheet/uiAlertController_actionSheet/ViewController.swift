//
//  ViewController.swift
//  uiAlertController_actionSheet
//
//  Created by yoshiyuki oshige on 2017/06/29.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func showActionSheet(_ sender: Any) {
        // アクションシートを作る
        let actionSheet = UIAlertController(
            title: "タイトル",
            message: "メッセージ文",
            preferredStyle: .actionSheet
        )
        
        // ボタン1
        actionSheet.addAction(
            UIAlertAction(
                title: "ボタン１です",
                style: .default,
                handler: {(action) -> Void in
                    self.hello(action.title!)
            })
        )
        
        // ボタン２
        actionSheet.addAction(
            UIAlertAction(
                title: "ボタン２です",
                style: .default,
                handler: {(action) -> Void  in
                    self.hello(action.title!)
            })
        )
        
        // キャンセル（追加順にかかわらず最後に表示される）
        actionSheet.addAction(
            UIAlertAction(
                title: "キャンセル",
                style: .cancel,
                handler: nil)
        )
        
        
        // 赤色のボタン
        actionSheet.addAction(
            UIAlertAction(
                title: "削除します",
                style: .destructive,
                handler: {(action) -> Void in
                    self.hello(action.title!)
            })
        )
        
        // アクションシートを表示する
        self.present(
            actionSheet,
            animated: true,
            completion: {
                // 表示完了後に実行
                print("アクションシートが表示された")
            }
        )
    }
    
    // 選んだボタンで実行するメソッド
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

