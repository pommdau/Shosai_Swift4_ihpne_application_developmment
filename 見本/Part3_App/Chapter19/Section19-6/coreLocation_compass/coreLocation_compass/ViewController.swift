//
//  ViewController.swift
//  coreLocation_compass
//
//  Created by yoshiyuki oshige on 2017/08/31.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    // ロケーションマネージャを作る
    var locationManager = CLLocationManager()
    // ラベル
    @IBOutlet weak var idoLabel: UILabel!
    @IBOutlet weak var keidoLabel: UILabel!
    @IBOutlet weak var hyoukouLabel: UILabel!
    @IBOutlet weak var henkakuLabel: UILabel!
    @IBOutlet weak var houiLabel: UILabel!
    // 磁北｜真北を選ぶセグメンテッドコントロール
    @IBOutlet weak var jihokuSeg: UISegmentedControl!
    // 磁針
    @IBOutlet weak var compass: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ラベルの初期化
        disabledLocationLabel()
        // アプリ利用中の位置情報の利用許可を得る
        locationManager.requestWhenInUseAuthorization()
        // ロケーションマネージャのdelegeteになる
        locationManager.delegate = self
        // ロケーション機能の設定
        setupLocationService()
        // コンパス機能を開始する
        startHeadingService()
    }
    
    // ロケーション機能の設定
    func setupLocationService() {
        // ロケーションの精度を設定する（ベスト）
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 更新距離（メートル）
        locationManager.distanceFilter = 1
    }
    
    //　ロケーションサービスの利用不可メッセージ
    func disabledLocationLabel() {
        let msg = "位置情報の利用が許可されてない。"
        idoLabel.text = msg
        keidoLabel.text = msg
        hyoukouLabel.text = msg
    }
    
    // コンパス機能
    func startHeadingService() {
        // セグメンテッドコントロールで磁北を選択する
        jihokuSeg.selectedSegmentIndex = 0
        // 自分が向いている方向をデバイスのポートレートの向きにする
        locationManager.headingOrientation = .portrait
        // ヘディングの更新角度（degree）
        locationManager.headingFilter = 1
        // ヘディングの更新を開始する
        locationManager.startUpdatingHeading()
    }
    
    // 位置情報利用許可のステータスが変わった
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse :
            // ロケーションの更新を開始する
            locationManager.startUpdatingLocation()
        case .notDetermined:
            // ロケーションの更新を停止する
            locationManager.stopUpdatingLocation()
            disabledLocationLabel()
        default:
            // ロケーションの更新を停止する
            locationManager.stopUpdatingLocation()
            disabledLocationLabel()
        }
    }
    
    // 位置を移動した
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // locationsの最後の値を取り出す
        let locationData = locations.last
        // 緯度
        if var ido = locationData?.coordinate.latitude {
            ido = round(ido*1000000)/1000000
            idoLabel.text = String(ido)
        }
        // 経度
        if var keido = locationData?.coordinate.longitude {
            keido = round(keido*1000000)/1000000
            keidoLabel.text = String(keido)
        }
        // 標高
        if var hyoukou = locationData?.altitude {
            hyoukou = round(hyoukou*100)/100
            hyoukouLabel.text = String(hyoukou) + " m"
        }
    }
    
    // 向いている方角が変わった
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        // 真北
        let makita = newHeading.trueHeading
        // 磁北
        let jihoku = newHeading.magneticHeading
        // 偏角
        var henkaku =  jihoku - makita
        if henkaku<0 {
            henkaku =  henkaku + 360
        }
        henkaku = round(henkaku*100)/100
        henkakuLabel.text = String(henkaku)
        // 北の方角
        var kitamuki:CLLocationDirection!
        if jihokuSeg.selectedSegmentIndex == 0 {
            kitamuki = jihoku
        } else {
            kitamuki = makita
        }
        // 磁針で北を指す
        compass.transform = CGAffineTransform(rotationAngle: CGFloat(-kitamuki * Double.pi/180))
        // デバイスが向いている方位角度
        let houikaku = round(kitamuki*100)/100
        houiLabel.text = String(houikaku)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
