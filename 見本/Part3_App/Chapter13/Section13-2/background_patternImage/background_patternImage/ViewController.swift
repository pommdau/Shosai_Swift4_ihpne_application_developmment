//
//  ViewController.swift
//  background_patternImage
//
//  Created by yoshiyuki oshige on 2017/08/12.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // パターンイメージ
        let image = UIImage(named: "stars.png")
        // 画面の背景色をパターンイメージにする
        self.view.backgroundColor = UIColor(patternImage: image!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

