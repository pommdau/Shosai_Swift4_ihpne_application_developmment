//
//  ViewController.swift
//  animation_fadeInOut_remove
//
//  Created by yoshiyuki oshige on 2017/08/23.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        // flowerを作る
        let flower = UIImageView(image: UIImage(named: "flower"))
        // 透明度を0にする
        flower.alpha = 0
        // タップされた座標にflowerを追加する
        flower.center = sender.location(in: self.view)
        view.addSubview(flower)
        
        // フェードインする
        UIView.animate(
            withDuration: 2.0, // 2.0秒かかって表示される
            delay: 0, // すぐに開始する
            options: [.curveEaseInOut],
            animations: {
                // 表示する
                flower.alpha = 1.0
        },
            completion:{(finished:Bool) in
                // フェードインが完了したら実行する
                self.fadeoutAndRemove(flower)
        })
        
    }
    
    // フェードアウトが完了したら取り除く
    func fadeoutAndRemove(_ view:UIView) {
        // フェードアウトする
        UIView.animate(
            withDuration: 2.0, // 2.0秒間かかって消える
            delay: 3.0, // 3秒後に消え始める
            options: UIViewAnimationOptions(),
            animations: {
                // 消える
                view.alpha = 0.0
        },
            completion:{(finished:Bool) in
                // ビューから取り除く
                view.removeFromSuperview()
        })
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

