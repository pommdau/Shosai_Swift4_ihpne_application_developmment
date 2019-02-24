//
//  ViewController.swift
//  19-7-A
//
//  Created by Hiroki Ikeuchi on 2019/02/24.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    // マップビュー
    @IBOutlet weak var myMap: MKMapView!
    // ツールバー
    @IBOutlet weak var toolBar: UIToolbar!
    var defaultColor:UIColor!
    
    // 横浜みなとみらいのりょういきを表示する
    @IBAction func gotoSpot(_ sender: Any) {
        // 緯度と経度
        let ido = 35.454954
        let keido = 139.6313859
        // 中心に表示する座標
        let center = CLLocationCoordinate2D(latitude: ido, longitude: keido)
        // スパン（焼く2.22km-2.22kmの範囲）
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.20)
        // 表示する領域
        let theRegion = MKCoordinateRegion(center: center, span: span)
        // 領域の地図を表示する
        myMap.setRegion(theRegion, animated: true)
    }
    
    // 地図のタイプを切り替える
    @IBAction func changedMapType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            // 地図
            myMap.mapType = .standard
            toolBar.tintColor = defaultColor
            toolBar.alpha = 0.8
        case 1:
            // 衛星写真
            myMap.mapType = .satellite
            toolBar.tintColor = UIColor.black
            toolBar.alpha = 0.8
        case 2:
            // ハイブリッド
            myMap.mapType = .hybrid
            toolBar.tintColor = defaultColor
            toolBar.alpha = 1.0
        case 3:
            myMap.mapType = .standard
            toolBar.tintColor = defaultColor
            toolBar.alpha = 1.0
            // 3d View
            myMap.camera.pitch = 70
            myMap.camera.altitude = 700 // 標高
        default:
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        defaultColor = toolBar.tintColor
        myMap.showsScale = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

