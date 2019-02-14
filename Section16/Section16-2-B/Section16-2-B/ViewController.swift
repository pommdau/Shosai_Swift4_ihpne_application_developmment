//
//  ViewController.swift
//  Section16-2-B
//
//  Created by Hiroki Ikeuchi on 2019/02/14.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var kakudo:CGFloat = 180.0
    
    // Actionに接続しておくと、ドラッグ中に繰り返し呼ばれる
    @IBAction func dragColor(_ sender: UIPanGestureRecognizer) {
        // ドラッグした量を調べる
        let translation = sender.translation(in: view)
        // 水平方向の移動量
        if translation.x>0 {
            // 右方向へドラッグしたら色相環を右回り
            kakudo -= 1.0
        } else {
            kakudo += 1.0
        }
        
        if kakudo<0 {
            kakudo += 360
        } else {
            kakudo -= 360
        }
        
        let color = UIColor(hue: kakudo/360, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        view.backgroundColor = color
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor(hue: kakudo/360, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

