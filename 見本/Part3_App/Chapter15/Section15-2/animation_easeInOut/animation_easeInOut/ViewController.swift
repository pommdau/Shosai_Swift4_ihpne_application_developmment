//
//  ViewController.swift
//  animation_easeInOut
//
//  Created by yoshiyuki oshige on 2017/08/22.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // アザラシ
    @IBOutlet weak var azarashi: UIImageView!
    
    // ビューがタップされたら実行
    @IBAction func tapVIew(_ sender: UITapGestureRecognizer) {
        // タップされた座標を調べる
        let tapPoint = sender.location(in: view)
        
        // 指定した最終値になるようにアニメーションする
        UIView.animate(withDuration: 1.0, // 1秒間で再生
            delay: 0, // 待ち時間なし
            options: [.curveEaseInOut], //イーズインアウト
            animations: {
                // タップした座標に移動
                self.azarashi.center = tapPoint
        },
            completion: nil)
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

