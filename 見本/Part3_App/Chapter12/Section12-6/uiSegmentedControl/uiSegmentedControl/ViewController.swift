//
//  ViewController.swift
//  uiSegmentedControl
//
//  Created by yoshiyuki oshige on 2017/08/09.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // ビューのプロパティ宣言
    @IBOutlet weak var colorChip: UIView!
    // セグメンテッドコントロールで色を選び直すと呼ばれる
    @IBAction func changedColor(_ sender: UISegmentedControl) {
        // 選ばれているインデックス番号で処理を振り分ける
        switch sender.selectedSegmentIndex {
        case 0:
            colorChip.backgroundColor = UIColor.blue
        case 1:
            colorChip.backgroundColor = UIColor.yellow
        case 2:
            colorChip.backgroundColor = UIColor.green
        default:
            colorChip.backgroundColor = UIColor.blue
        }
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

