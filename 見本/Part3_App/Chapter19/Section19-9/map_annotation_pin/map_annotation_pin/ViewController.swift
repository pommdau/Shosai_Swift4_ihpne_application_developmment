//
//  ViewController.swift
//  map_annotation_pin
//
//  Created by yoshiyuki oshige on 2017/09/03.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    // アノテーションの配列
    var annotationlist = Array<MKPointAnnotation>()
    // マップビューとOutlet接続する
    @IBOutlet weak var myMap: MKMapView!
    // 最後のピンの削除
    @IBAction func removeLastPin(_ sender: Any){
        // 最後に追加したピンを削除する
        if annotationlist.count>0{
            let lastPin = annotationlist.removeLast()
            myMap.removeAnnotation(lastPin)
        }
    }
  
    // 地図を長押しした
    @IBAction func mapLongPress(_ sender: UILongPressGestureRecognizer) {
        // 長押しの終了でのみ実行する
        guard sender.state == UIGestureRecognizerState.ended else {
            return //長押しの開始と最中はキャンセルする
        }
        // 長押しの座標を取り出す
        let pressPoint = sender.location(in: myMap)
        // マップの座標に変換する
        let pressCoordinate = myMap.convert(pressPoint, toCoordinateFrom: myMap)
        // アノテーションを作る
        let annotation = MKPointAnnotation()
        annotation.coordinate = pressCoordinate
        annotation.title = "ここ！"
        // アノテーションを配列に追加する
        annotationlist.append(annotation)
        // アノテーションを地図に表示する
        myMap.addAnnotation(annotation)
    }
    
    // 虫ピンを使う
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // ドラッグ可能なピンを作る
        let pinView = MKPinAnnotationView()
        pinView.animatesDrop = true // 落ちてくる
        pinView.isDraggable = true // ドラッグ可能
        pinView.pinTintColor = UIColor.blue // 色
        pinView.canShowCallout = true // タップでタイトル表示
        return pinView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // 中心座標（横浜中華街）
        let center = CLLocationCoordinate2D(latitude: 35.4424225, longitude: 139.6465645)
        // 表示範囲
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        // 地図の表示領域を決める
        let region = MKCoordinateRegion(center: center, span: span)
        myMap.setRegion(region, animated:true)
        // マップビューのデリゲートになる
        myMap.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

