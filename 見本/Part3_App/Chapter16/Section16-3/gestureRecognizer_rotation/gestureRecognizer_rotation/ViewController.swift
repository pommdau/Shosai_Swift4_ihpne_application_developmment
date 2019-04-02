//
//  ViewController.swift
//  gestureRecognizer_rotation
//
//  Created by yoshiyuki oshige on 2017/08/24.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // トンボとOutlet接続する
    @IBOutlet weak var tombo: UIImageView!
    // 最後の回転角度
    var lastRotation:CGFloat = 0.0
    
    // ビューのローテーションでトンボを回す
    @IBAction func rotateTombo(_ sender: UIRotationGestureRecognizer) {
        
        switch sender.state {
        case .began:
            // 前回の回転角度からはじめる
            sender.rotation = lastRotation
        case .changed:
            // 回転角度にトンボを合わせる
            tombo.transform = CGAffineTransform(rotationAngle: sender.rotation)
        case .ended:
            // 回転終了時の回転角度を保存する
            lastRotation = sender.rotation
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

