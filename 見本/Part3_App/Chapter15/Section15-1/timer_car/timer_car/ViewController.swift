//
//  ViewController.swift
//  timer_car
//
//  Created by yoshiyuki oshige on 2017/08/22.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 車
    @IBOutlet weak var car: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // タイマーを作る
        Timer.scheduledTimer(
            timeInterval: 0.1, // 繰り返す間隔（秒）
            target: self,
            selector: #selector(self.step), // 実行するメソッド
            userInfo: nil,
            repeats: true // リピート再生する
        )
    }
    
    // タイマーから定期的に呼び出されるメソッド
    @objc func step() {
        // 水平方向へ移動
        car.center.x += 10
        // 右辺から外へ出たら
        let carWidth = car.bounds.width
        if car.center.x>(view.bounds.width + carWidth/2) {
            // 左辺の手前に戻す
            car.center.x = -carWidth
            // y 座標はランダムな高さに変更
            let viewH = view.bounds.height
            car.center.y = CGFloat(arc4random_uniform(UInt32(viewH)))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

