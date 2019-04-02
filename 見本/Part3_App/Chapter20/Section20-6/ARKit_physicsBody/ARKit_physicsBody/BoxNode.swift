//
//  BoxNode.swift
//  ARKit_physicsBody
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
        let y = pos.y + Float(box.height/2.0) + 0.2 // 箱の高さより0.2m上から落とす
        position = SCNVector3(pos.x, y, pos.z)
        // 物理ボディを設定する
        let bodyShape = SCNPhysicsShape(geometry: geometry!, options: [:])
        physicsBody = SCNPhysicsBody(type: .dynamic, shape: bodyShape)
        physicsBody?.friction = 1.0  // 摩擦
        physicsBody?.restitution = 0.2  // 反発力
        // 衝突する相手を決める（CategoryはPlaneNode.swiftで定義している）
        physicsBody?.categoryBitMask = Int(Category.boxCategory.rawValue)  // 自身のカテゴリ
        physicsBody?.collisionBitMask = Int(Category.planeCategory.rawValue | Category.boxCategory.rawValue)
    }
}

