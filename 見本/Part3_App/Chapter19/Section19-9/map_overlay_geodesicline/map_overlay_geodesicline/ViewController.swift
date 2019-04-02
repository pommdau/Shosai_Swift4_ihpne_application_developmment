//
//  ViewController.swift
//  map_overlay_geodesicline
//
//  Created by yoshiyuki oshige on 2017/09/04.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate{
    // 地点の座標
    let tokyo = CLLocationCoordinate2D(latitude: 35.669107, longitude: 139.6009553)
    let cairo = CLLocationCoordinate2D(latitude: 30.0594838, longitude: 31.223445)
    // マップビューとOutlet接続する
    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 中心座標
        let cx = (tokyo.latitude+cairo.latitude)/2
        let cy = (tokyo.longitude+cairo.longitude)/2
        let center = CLLocationCoordinate2D(latitude: cx, longitude: cy)
        // 表示範囲
        let span = MKCoordinateSpan(latitudeDelta:25.0, longitudeDelta: 25.0)
        // 地図の表示領域を決める
        let region = MKCoordinateRegion(center: center, span: span)
        myMap.setRegion(region, animated:true)
        // マップビューのデリゲートになる
        myMap.delegate = self
        // 座標の配列
        let locs = [tokyo, cairo]
        // 測地線に沿って線を引く
        let line = MKGeodesicPolyline(coordinates: locs, count: locs.count)
        myMap.add(line)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        // 線を描くレンダラー
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.lineWidth = 3
        renderer.strokeColor = UIColor.red
        return renderer
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

