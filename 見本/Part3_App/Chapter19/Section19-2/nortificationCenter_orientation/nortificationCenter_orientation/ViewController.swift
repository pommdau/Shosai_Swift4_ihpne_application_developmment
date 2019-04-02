//
//  ViewController.swift
//  nortificationCenter_orientation
//
//  Created by yoshiyuki oshige on 2017/08/28.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var labelABC: UILabel!
    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var labelB: UILabel!
    @IBOutlet weak var labelC: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 通知センターのオブジェクトを作る
        let notification = NotificationCenter.default
        // デバイスの向きが変わった
        notification.addObserver(self,
                                 selector: #selector(self.changedDeviceOrientation(_:)),
                                 name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }
    
    // イベントで呼び出されるメソッド
    @objc func changedDeviceOrientation(_ notification :Notification) {
        print(UIDevice.current)
        // デバイスを取得する
        let device = UIDevice.current
        // デバイスの向きを調べる
        switch device.orientation {
        case .portrait: // ポートレート
            // ラベルを0度に回転
            rotateLabel(0)
        case .portraitUpsideDown: // 逆さま
            // ラベルを180度に回転
            rotateLabel(CGFloat(Double.pi))
        case .landscapeLeft: // デバイスは左回転
            // ラベルは90度に回転
            rotateLabel(CGFloat(Double.pi/2))
        case .landscapeRight: // デバイスは右回転
            // ラベルは-90度に回転
            rotateLabel(CGFloat(-Double.pi/2))
        default:
            break
        }
    }
    
    // ラベルを回転させる
    func rotateLabel(_ radian :CGFloat) {
        let transform = CGAffineTransform(rotationAngle: radian)
        labelABC.transform = transform
        labelA.transform = transform
        labelB.transform = transform
        labelC.transform = transform
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

