//
//  ViewController.swift
//  ARKit_SpriteKit
//
//  Created by yoshiyuki oshige on 2017/09/12.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit

class ViewController: UIViewController, ARSKViewDelegate {
    
    @IBOutlet var sceneView: ARSKView!
    var num:Int = 0  // カウントアップするために値を保持する
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ビューのデリゲートになる
        sceneView.delegate = self
        // fps、ノード数を表示する
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        
        // SKSceneシーンを作る
        if let scene = SKScene(fileNamed: "Scene.sks") {
            sceneView.presentScene(scene)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // セッションのコンフィグを作る
        let configuration = ARWorldTrackingConfiguration()
        // セッションを開始する
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // セッションを停止する
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    // MARK: - ARSKViewDelegate
    // アンカーが追加されたときに呼ばれる
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        // ノードを作る
        let labelNode = SKLabelNode(text: String(num))
        num += 1  // カウントアップ
        labelNode.horizontalAlignmentMode = .center
        labelNode.verticalAlignmentMode = .center
        // アンカーに表示するノードを返す
        return labelNode;
    }
    
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

