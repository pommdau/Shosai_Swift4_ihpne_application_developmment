//
//  DetailViewController.swift
//  Section19-1
//
//  Created by Hiroki Ikeuchi on 2019/02/18.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override var shouldAutorotate : Bool {
        // オートローテーションを許可する
        return true
    }
    
    // 回転を許可する回転の向きを返す
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    // シーンを閉じる
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
