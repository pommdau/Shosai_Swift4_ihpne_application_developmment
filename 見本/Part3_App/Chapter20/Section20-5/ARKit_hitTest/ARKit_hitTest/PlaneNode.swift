//
//  PlaneNode.swift
//  ARKit_hitTest
//
//  Created by yoshiyuki oshige on 2017/09/14.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class PlaneNode: SCNNode {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(anchor: ARPlaneAnchor) {
        super.init()
        // 平面のジオメトリを作る
        let plane = SCNPlane(width: CGFloat(anchor.extent.x), height: CGFloat(anchor.extent.z))
        // 緑で塗りは半透明（ワイヤーフレームはsceneViewで設定、白色）
        plane.firstMaterial?.diffuse.contents = UIColor.green.withAlphaComponent(0.5)
        plane.widthSegmentCount = 10
        plane.heightSegmentCount = 10
        // ノードのgeometryプロパティに設定する
        geometry = plane
        // トランスフォームはX軸回りで90度回転 -- 手前へ倒れて水平になる
        transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
        // 位置決めする
        position = SCNVector3(anchor.center.x, 0, anchor.center.z)
    }
    
    // 位置とサイズを更新する
    func update(anchor: ARPlaneAnchor) {
        // ジオメトリを取り出す
        let plane = geometry as! SCNPlane
        // アンカーから平面の幅、高さを更新する
        plane.width = CGFloat(anchor.extent.x)
        plane.height = CGFloat(anchor.extent.z)
        // 座標を更新する
        position = SCNVector3(anchor.center.x, 0, anchor.center.z)
    }
}

