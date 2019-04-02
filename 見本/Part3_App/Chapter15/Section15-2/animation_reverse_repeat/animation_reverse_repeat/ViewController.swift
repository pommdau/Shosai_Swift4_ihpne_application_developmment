//
//  ViewController.swift
//  animation_reverse_repeat
//
//  Created by yoshiyuki oshige on 2017/08/22.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // アザラシをビューに追加する
        let azarashi = UIImageView(image: UIImage(named: "azarashi"))
        azarashi.center = CGPoint(x: 50, y: 150)
        view.addSubview(azarashi)
        
        // 画面を横に行ったり来たりする
        UIView.animate(withDuration: 1.0, // 1秒間で再生
            delay: 0, // 待ち時間なし
            options: [.curveEaseInOut, // イーズインアウト
                .autoreverse, // 逆再生
                .repeat], // 繰り返し
            animations: {
                // 画面の右端へ移動する
                azarashi.center.x = self.view.frame.width - 50
        },
            completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

