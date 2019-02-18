//
//  ViewController.swift
//  Section19-3-A
//
//  Created by Hiroki Ikeuchi on 2019/02/19.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // プレビュー用のビューとOutlet接続
    @IBOutlet weak var previewView: UIView!
    // インスタンスの作成
    var session        = AVCaptureSession()     // セッションの作成
    var photoOutputObj = AVCapturePhotoOutput() // 出力先の作成
    
    // 入出力の設定
    func setupInputOutput() {
        // 解像度の指定
        session.sessionPreset = AVCaptureSession.Preset.photo
        
        // 入力の指定
        do {
            // デバイスの取得
            let device = AVCaptureDevice.default(
                AVCaptureDevice.DeviceType.builtInWideAngleCamera,
                for: AVMediaType.video, // ビデオ入力
                position: AVCaptureDevice.Position.back)    // バックカメラ
            // 入力先
            let input = try AVCaptureDeviceInput(device: device!)
            if session.canAddInput(input) {
                session.addInput(input)
            } else {
                print("セッションに入力を追加できなかった")
                return
            }
        } catch let error as NSError {
                print("カメラがない\(error)")
                return
        }
    }
    
    // プレビューレイヤの設定
    func setPreviewLayer() {
        // プレビューレイヤを作る
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = view.bounds
        previewLayer.masksToBounds = true
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspect
        // previewViewに追加する
        previewView.layer.addSublayer(previewLayer)
        
    }
    
    // 通知センターを作る
    let notification = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // セッション実行中有ならば中断する
        if session.isRunning {
            return
        }
        // 入出力の設定
        setupInputOutput()
        // プレビューレイヤの設定
        setPreviewLayer()
        // セッション開始
        session.startRunning()
        
        // デバイスが回転したときに通知するイベントハンドラを設定する
        notification.addObserver(self,
                                 selector: #selector(changedDeviceOrientation(_:)),
                                 name: NSNotification.Name.UIDeviceOrientationDidChange,
                                 object: nil)
    }
    
    // デバイスの向きが変わったときに呼び出すメソッド
    @objc func changedDeviceOrientation(_ notification :Notification) {
        // photoOutputObj.connectionの回転向きをデバイスとあわせる
        if let photoOutputConnection = self.photoOutputObj.connection(with: AVMediaType.video) {
            switch UIDevice.current.orientation {
            case .portrait:
                photoOutputConnection.videoOrientation = .portrait
            case .portraitUpsideDown:
                photoOutputConnection.videoOrientation = .portraitUpsideDown
            case .landscapeLeft:
                photoOutputConnection.videoOrientation = .landscapeRight
            case .landscapeRight:
                photoOutputConnection.videoOrientation = .landscapeLeft
            default:
                break
            }
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // シャッターボタンで実行
    @IBAction func takePhoto(_ sender: Any) {
        let captureSetting = AVCapturePhotoSettings()
        captureSetting.flashMode = .auto
        captureSetting.isAutoStillImageStabilizationEnabled = true
        captureSetting.isHighResolutionPhotoEnabled = false
        // キャプチャのイメージ処理はデリゲートに任せる
        photoOutputObj.capturePhoto(with: captureSetting, delegate: self)
    }
    
}

