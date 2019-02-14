//
//  ViewController.swift
//  Section15-4
//
//  Created by Hiroki Ikeuchi on 2019/02/14.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        let flower = UIImageView(image: UIImage(named: "flower"))
        flower.alpha = 0
        flower.center = sender.location(in: self.view)
        view.addSubview(flower)
        
        UIView.animate(
            withDuration: 2.0,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                flower.alpha = 1.0
        },
            completion: {(finished:Bool) in
                self.fadeoutAndRemove(flower)
        })
    }
    
    func fadeoutAndRemove(_ view:UIView) {
        UIView.animate(
            withDuration: 2.0,
            delay: 3.0,
            options: UIViewAnimationOptions(),
            animations: {
                view.alpha = 0.0
        }, completion: {(finished:Bool) in
            view.removeFromSuperview()
        })
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

