//
//  BoxNode.swift
//  ARKit_hitTest
//
//  Created by yoshiyuki oshige on 2017/09/16.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class BoxNode: SCNNode {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(hitTestResult: ARHitTestResult) {
        super.init()
        // ジオメトリを作る
        let box = SCNBox(width: 0.1, height: 0.05, length: 0.1, chamferRadius: 0.01)
        // 塗り
        box.firstMaterial?.diffuse.contents = UIColor.gray
        // ノードのgeometryプロパティに設定する
        geometry = box
        // タップされた座標から位置決めする
        let pos = hitTestResult.worldTransform.columns.3
        let y = pos.y + Float(box.height/2.0) // 水平面と箱の底を合わせる
        position = SCNVector3(pos.x, y, pos.z)
    }
}

