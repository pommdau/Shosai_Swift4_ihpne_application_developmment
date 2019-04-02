//
//  ViewController.swift
//  func_RGBA
//
//  Created by yoshiyuki oshige on 2017/08/09.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // RGBA(255,255,255,1)からUIColorを作る
    func RGBA(red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat) -> UIColor {
        // 0〜1に換算する
        let r = red/255.0
        let g = green/255.0
        let b = blue/255.0
        let rgba = UIColor(red: r, green: g, blue: b, alpha: alpha)
        return rgba
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 色を作る
        let color = RGBA(red: 100, green: 255, blue: 200, alpha: 1)
        // 背景色を指定する
        self.view.backgroundColor = color
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

