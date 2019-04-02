//
//  ViewController.swift
//  map_annotation
//
//  Created by yoshiyuki oshige on 2017/09/03.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    // マップビューとOutlet接続する
    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 中心座標（横浜中華街）
        let center = CLLocationCoordinate2D(latitude: 35.4424225, longitude: 139.6465645)
        // 表示範囲（約222m×222mの範囲）
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        // 地図の表示領域を決める
        let region = MKCoordinateRegion(center: center, span: span)
        myMap.setRegion(region, animated:true)
        // アノテーションを作る
        let annotation = MKPointAnnotation()
        annotation.coordinate  = center
        annotation.title = "ここです！"
        annotation.subtitle = "私、待ってます"
        // アノテーションを表示する
        myMap.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

