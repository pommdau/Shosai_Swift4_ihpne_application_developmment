//
//  ViewController.swift
//  view_frame
//
//  Created by yoshiyuki oshige on 2017/08/12.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 写真をOutlet接続しておく
    @IBOutlet weak var myPhoto: UIImageView!
    
    // セグメンテッドコントロールとAction接続する
    @IBAction func changedFrame(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index {
        case 0 : // 小さく表示
            myPhoto.frame = CGRect(x: 50, y: 120, width: 160, height: 120)
        case 1 : // 大きく表示
            myPhoto.frame = CGRect(x: 30, y: 120, width: 256, height: 192)
        default :
            myPhoto.frame = CGRect(x: 30, y: 120, width: 256, height: 192)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 表示モードの設定
        myPhoto.contentMode = .scaleAspectFill
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

