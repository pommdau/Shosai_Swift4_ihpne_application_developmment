//
//  ViewController.swift
//  Section16-1-B
//
//  Created by Hiroki Ikeuchi on 2019/02/14.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.hello(_:)))
        let myView = UIView(frame: CGRect(x: 100, y: 100, width: 80, height: 80))
        myView.backgroundColor = UIColor.green
        myView.tag = 1
        myView.addGestureRecognizer(tapGesture)
        view.addSubview(myView)
    }

    @objc func hello(_ sender:UITapGestureRecognizer) {
        let tapNo = sender.view?.tag
        print("Hello", tapNo!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

