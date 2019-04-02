//
//  Scene.swift
//  ARKit_SpriteKit
//
//  Created by yoshiyuki oshige on 2017/09/12.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import SpriteKit
import ARKit

class Scene: SKScene {
    
    override func didMove(to view: SKView) {
        // Setup your scene here
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    // ビューのタッチで実行する
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // ARSKView型のビューでないときは中断する
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        // カメラの現在位置を利用してアンカーを作る
        if let currentFrame = sceneView.session.currentFrame {
            // トランスフォームを作る
            var translation = matrix_identity_float4x4
            translation.columns.3.z = -0.2
            // カメラの移動／回転を示すトランスフォーム（0.2m離れた位置）
            let transform = simd_mul(currentFrame.camera.transform, translation)
            // アンカーを作る
            let anchor = ARAnchor(transform: transform)
            // アンカーをシーンビューに追加する
            sceneView.session.add(anchor: anchor)
        }
    }
}

