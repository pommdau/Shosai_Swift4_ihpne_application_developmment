//
//  ViewController.swift
//  uiImageView_animation_running
//
//  Created by yoshiyuki oshige on 2017/08/23.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // アニメーションのイメージビューをOutlet接続する
    @IBOutlet weak var boyView: UIImageView!
    // スライダーをOutlet接続する
    @IBOutlet weak var mySlider: UISlider!
    
    // スライダとActions接続する
    @IBAction func runSpeed(_ sender: UISlider) {
        // スライダの値が0のとき止める
        if sender.value == 0 {
            // アニメーションをストップする
            boyView.stopAnimating()
            // 立ち止まっているイメージに変える
            boyView.image = UIImage(named: "jogboy_0")
        } else {
            // 再生秒数をスライダで決める
            let sec = sender.maximumValue - sender.value
            // 再生にかかる秒数を設定する
            boyView.animationDuration = TimeInterval(sec)
            // アニメーションが止まっているならば再生する
            if !boyView.isAnimating {
                // アニメーションをスタートする
                boyView.startAnimating()
            }
        }
    }
    
    // コマ送りのイメージの配列を作る
    func jogboyImages () -> Array<UIImage> {
        var theArray = Array<UIImage>()
        for num in 1...10 {
            // jogboy_1〜jogboy_10のイメージを作る
            let imageName = "jogboy_" + String(num)
            let image = UIImage(named: imageName)
            // 配列に追加する
            theArray.append(image!)
        }
        return theArray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // スライダの範囲（最小値と最大値）を決める
        mySlider.minimumValue = 0.0
        mySlider.maximumValue = 5.0
        // スライダの開始位置を0にする
        mySlider.value = 0.0
        // 再生するイメージの配列を設定する
        boyView.animationImages = jogboyImages()
        // 無限ループ再生に設定する
        boyView.animationRepeatCount = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

