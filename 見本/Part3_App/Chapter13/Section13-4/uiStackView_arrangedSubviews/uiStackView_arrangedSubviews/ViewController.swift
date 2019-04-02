//
//  ViewController.swift
//  uiStackView_arrangedSubviews
//
//  Created by yoshiyuki oshige on 2017/08/13.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // スタックビューに入れるビューを準備する
        let view1 = UIView()
        view1.backgroundColor = .lightGray
        let view2 = UIView()
        view2.backgroundColor = .gray
        // 写真のイメージビュー
        let photo1 = UIImageView(image: UIImage(named: "IMG_4048.jpg"))
        let photo2 = UIImageView(image: UIImage(named: "IMG_4202.jpg"))
        let photo3 = UIImageView(image: UIImage(named: "IMG_4854.jpg"))
        photo1.contentMode = .scaleAspectFill
        photo1.clipsToBounds = true
        photo2.contentMode = .scaleAspectFill
        photo2.clipsToBounds = true
        photo3.contentMode = .scaleAspectFill
        photo3.clipsToBounds = true
        
        // スタックビューを作る
        let rect = CGRect(x: 0, y: 0, width: 300, height: 600)
        let stackView = UIStackView(frame: rect)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        // スタックビューに用意しておいたビューを追加する
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        stackView.addArrangedSubview(photo1)
        stackView.addArrangedSubview(photo2)
        stackView.addArrangedSubview(photo3)
        
        // スタックビューを画面中央に表示する
        stackView.center = self.view.center
        self.view.addSubview(stackView)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

