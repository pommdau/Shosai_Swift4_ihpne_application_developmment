//
//  ViewController.swift
//  Section19-2-A
//
//  Created by Hiroki Ikeuchi on 2019/02/18.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelABC: UILabel!
    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var labelB: UILabel!
    @IBOutlet weak var labelC: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 通知センターのオブジェクトを作る
        let notification = NotificationCenter.default
        // デバイスの向きが変わった
        notification.addObserver(self,
                                 selector: #selector(self.changeDeviceOrientation(_:)),
                                 name: NSNotification.Name.UIDeviceOrientationDidChange,
                                 object: nil)
    }

    // イベントで呼び出されるメソッド
    @objc func changeDeviceOrientation(_ notification :Notification) {
        // デバイスの取得
        let device = UIDevice.current
        // デバイスの向きを調べる
        switch device.orientation {
        case .portrait: // ポートレート
            rotateLabel(0)
        case .portraitUpsideDown:
            rotateLabel(CGFloat(Double.pi))
        case .landscapeLeft:
            rotateLabel(CGFloat(Double.pi/2))
        case .landscapeRight:
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

