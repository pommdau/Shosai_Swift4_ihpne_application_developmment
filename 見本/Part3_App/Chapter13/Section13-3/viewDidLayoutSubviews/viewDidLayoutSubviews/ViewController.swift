//
//  ViewController.swift
//  viewDidLayoutSubviews
//
//  Created by yoshiyuki oshige on 2017/08/12.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 車をOutlet接続しておく
    @IBOutlet weak var myCar: UIImageView!
    // ホーム座標を決める
    let homePoint = CGPoint(x:100, y:150)
    
    // ホームに戻る
    @IBAction func goHome(_ sender: AnyObject) {
        myCar.center = homePoint
    }
    
    // 右へ進む
    @IBAction func move(_ sender: AnyObject) {
        myCar.center.x += 10
    }
    
    // 開始時にホームに移動する
    override func viewDidLayoutSubviews() {
        myCar.center = homePoint
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

