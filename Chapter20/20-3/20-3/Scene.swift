//
//  Scene.swift
//  20-3
//
//  Created by Hiroki Ikeuchi on 2019/09/04.
//  Copyright © 2019 ikeh1024. All rights reserved.
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
        
        // Create anchor using the camera's current position
        // カメラの現在位置を利用してアンカーを作る
        if let currentFrame = sceneView.session.currentFrame {
            
            // トランスフォームを作る
            var translation = matrix_identity_float4x4
            translation.columns.3.z = -0.2
            // カメラの移動・回転を表すトランスフォーム
            let transform = simd_mul(currentFrame.camera.transform, translation)
            
            // Add a new anchor to the session
            let anchor = ARAnchor(transform: transform)
            sceneView.session.add(anchor: anchor)
        }
    }
}
