//
//  ViewController.swift
//  animation_easeInOut
//
//  Created by Hiroki Ikeuchi on 2019/02/13.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var azarashi: UIImageView!
    
    // tap and run
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        let tapPoint = sender.location(in: view)
        
        UIView.animate(
            withDuration: 1.0,  // 1.0sで再生
            delay: 0,           // 待ち時間なし
            options: [.curveEaseInOut], // イーズインアウト
            animations: {
                self.azarashi.center = tapPoint // タップした位置にアザラシを移動
        },
            completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let azarashi = UIImageView(image: UIImage(named: "azarashi"))
        azarashi.center = CGPoint(x: 50, y: 150)
        view.addSubview(azarashi)
        
        // 画面を行ったり来たりする
        UIView.animate(
            withDuration: 1.0,
            delay: 0,
            options: [.curveEaseInOut,
                      .autoreverse,
                      .repeat],
            animations: {
                azarashi.center.x = self.view.frame.width - 50
        },
            completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
}

