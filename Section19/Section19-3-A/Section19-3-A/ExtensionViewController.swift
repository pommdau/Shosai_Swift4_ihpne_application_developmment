//
//  ExtensionViewController.swift
//  Section19-3-A
//
//  Created by Hiroki Ikeuchi on 2019/02/19.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import Photos

// デリゲート部分を拡張する
extension ViewController:AVCapturePhotoCaptureDelegate {
    // 映像をキャプチャする
    func photoOutput(_ output: AVCapturePhotoOutput,
                     didFinishProcessingPhoto photo: AVCapturePhoto,
                     error: Error?) {
        // Dataを取り出す
        guard let photoData = photo.fileDataRepresentation() else {
            return
        }
        // Dataから写真イメージを作る
        if let stillImage = UIImage(data: photoData) {
            // アルバムに追加する
            UIImageWriteToSavedPhotosAlbum(stillImage, self, nil, nil)
        }
        
    }

}
    

