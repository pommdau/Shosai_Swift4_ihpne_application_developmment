//
//  ViewController.swift
//  presentVC
//
//  Created by yoshiyuki oshige on 2017/08/18.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func gotoTreePage(_ sender: Any) {
        // 移動先のビューコントローラを参照する
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "treePage")
        // トランジションの映像効果を指定する
        nextVC?.modalTransitionStyle = .flipHorizontal
        // シーンを移動する
        present(nextVC!, animated: true, completion: nil)
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

