//
//  ViewController.swift
//  map_overlay_line_circle
//
//  Created by yoshiyuki oshige on 2017/09/03.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    // 地点の座標
    let loc1 = CLLocationCoordinate2D(latitude: 35.690553, longitude: 139.699579)
    let loc2 = CLLocationCoordinate2D(latitude: 35.531365, longitude: 139.696889)
    let loc3 = CLLocationCoordinate2D(latitude: 35.454954, longitude: 139.6313859)
    
    // マップビューとOutlet接続する
    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 中心座標
        let center = CLLocationCoordinate2D(latitude: 35.531365, longitude: 139.696889)
        // 表示範囲
        let span = MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4)
        // 地図の表示領域を決める
        let region = MKCoordinateRegion(center: center, span: span)
        myMap.setRegion(region, animated:true)
        // マップビューのデリゲートになる
        myMap.delegate = self
        // 座標の配列
        let locs = [loc1, loc2, loc3]
        for loc in locs {
            // 円を描く
            let circle = MKCircle(center: loc, radius: 3000)
            myMap.add(circle)
        }
        // 座標を線で結ぶ
        let line = MKPolyline(coordinates: locs, count: locs.count)
        myMap.add(line)
        
    }
        
        
    // オーバーレイを追加するイベントを受けて利用するレンダラーを指定する
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer:MKOverlayPathRenderer
        
        switch overlay {
        case is MKPolyline:
             // 線を描くレンダラー
            renderer = MKPolylineRenderer(overlay: overlay)
            renderer.lineWidth = 2
            renderer.strokeColor = UIColor.blue
        case is MKCircle:
            // 円を描くレンダラー
            renderer = MKCircleRenderer(circle: overlay as! MKCircle)
            renderer.lineWidth = 2
            renderer.strokeColor = UIColor.red
            renderer.fillColor = UIColor.red
            renderer.alpha = 0.3
        default:
            renderer = MKPolylineRenderer(overlay: overlay)
        }
        return renderer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

