//
//  ViewController.swift
//  gestureRecognizer_drag_color
//
//  Created by yoshiyuki oshige on 2017/08/24.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 0〜360
    var kakudo:CGFloat = 180.0
    
    @IBAction func dragColor(_ sender: UIPanGestureRecognizer) {
        // ドラッグした量を調べる
        let translation = sender.translation(in: view)
        // 水平方向の移動量
        if translation.x>0 {
            // 右方向へドラッグしたら色相環を右回り
            kakudo -= 1.0
        } else {
            // 左方向へドラッグしたら色相環を左回り
            kakudo += 1.0
        }
        
        // 0〜360の間で回す
        if kakudo<0 {
            kakudo += 360
        } else if kakudo>360 {
            kakudo -= 360
        }
        
        // ビューの背景色を変更する
        let color = UIColor(hue: kakudo/360, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        view.backgroundColor = color
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 最初の色を合わせる
        view.backgroundColor = UIColor(hue: kakudo/360, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

