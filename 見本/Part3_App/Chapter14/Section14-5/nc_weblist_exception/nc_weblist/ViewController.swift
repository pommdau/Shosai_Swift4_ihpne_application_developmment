//
//  ViewController.swift
//  nc_weblist
//
//  Created by yoshiyuki oshige on 2017/08/20.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    // WebKitビューとOutlet接続する
    @IBOutlet weak var webView: WKWebView!
    // シーン移動の際に設定されるWebデータ
    var data:(name:String, url:String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // dataが設定されていればwebDataに代入する
        guard let webData = data else {
            return
        }
        // 表示するWebページのURLRequestを作る
        let myURL = URL(string: webData.url)
        let myRequest = URLRequest(url: myURL!)
        // Webを読み込む
        webView.load(myRequest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

