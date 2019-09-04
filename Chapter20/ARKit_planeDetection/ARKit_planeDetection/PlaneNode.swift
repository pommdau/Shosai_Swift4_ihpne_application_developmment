//
//  PlaneNode.swift
//  ARKit_planeDetection
//
//  Created by Hiroki Ikeuchi on 2019/09/05.
//  Copyright © 2019 ikeh1024. All rights reserved.
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
        plane.firstMaterial?.diffuse.contents = UIColor.green.withAlphaComponent(0.5)
        plane.widthSegmentCount = 10
        plane.heightSegmentCount = 10
        geometry = plane
        transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
        position = SCNVector3(anchor.center.x, 0, anchor.center.z)
    }
    
    func update(anchor: ARPlaneAnchor) {
        let plane = geometry as! SCNPlane
        plane.width = CGFloat(anchor.extent.x)
        plane.height = CGFloat(anchor.extent.z)
        position = SCNVector3(anchor.center.x, 0, anchor.center.z)
    }
    
}
