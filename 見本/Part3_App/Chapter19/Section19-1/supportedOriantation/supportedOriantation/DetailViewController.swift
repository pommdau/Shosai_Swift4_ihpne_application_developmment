//
//  DetailViewController.swift
//  supportedOriantation
//
//  Created by yoshiyuki oshige on 2017/08/28.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    override var shouldAutorotate : Bool {
        // オートローテーションを許可する
        return true
    }
    
    // 回転を許可する回転の向きを返す
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        // ポートレート向きだけを許可する
        return UIInterfaceOrientationMask.portrait
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
