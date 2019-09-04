//
//  ViewController.swift
//  ARappTemp_SceneKit
//
//  Created by Hiroki Ikeuchi on 2019/09/03.
//  Copyright © 2019 ikeh1024. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // fpsなどを表示する
        sceneView.showsStatistics = true
        // 空のシーンを作る
        let scene = SCNScene()
        sceneView.scene = scene
        
        // ジオメトリ（球体）
        let earth = SCNSphere(radius: 0.2)
        // Textureの貼り付け
        earth.firstMaterial?.diffuse.contents = UIImage(named: "earth_1024")
        // Node(AR空間に配置できるオブジェクト)
        let earthNode = SCNNode(geometry: earth)
        // Animation
        let action = SCNAction.rotateBy(x: 0, y: .pi*2, z: 0, duration: 100)
        earthNode.runAction(SCNAction.repeatForever(action))
        
        // 位置決め
        earthNode.position = SCNVector3(0.2, 0.3, -0.2)
        // シーンに追加
        sceneView.scene.rootNode.addChildNode(earthNode)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // セッションのコンフィグを作る
        let configuration = ARWorldTrackingConfiguration()
        // セッションの開始
        sceneView.session.run(configuration)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // セッションを停止
        sceneView.session.pause()

    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
