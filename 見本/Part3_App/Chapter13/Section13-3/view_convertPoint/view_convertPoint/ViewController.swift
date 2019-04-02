//
//  ViewController.swift
//  view_convertPoint
//
//  Created by yoshiyuki oshige on 2017/08/12.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var arrow: UIImageView!
    @IBOutlet weak var sky: UIView!
    @IBOutlet weak var tombo: UIImageView!
    
    @IBAction func catchTombo(_ sender: Any) {
        // skyビューの座標tombo.centerをviewビューの座標系に変換する
        var point = view.convert(tombo.center, from: sky)
        
        // 矢印の先端がpointを指し示すように調整する
        point.x += arrow.bounds.width/2
        point.y -= arrow.bounds.height/2
        // 矢印を移動させる
        arrow.center = point
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

