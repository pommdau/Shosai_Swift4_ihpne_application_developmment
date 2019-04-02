//
//  MyTabBarController.swift
//  tabbedApp
//
//  Created by yoshiyuki oshige on 2017/08/22.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // Thirdタブだったときバッジを消す
        if item.title == "Third" {
            item.badgeValue = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 3番目のタブにバッジ"New"を付ける
        let tabBartItem = tabBar.items?[2]
        tabBartItem?.badgeValue = "New"
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
