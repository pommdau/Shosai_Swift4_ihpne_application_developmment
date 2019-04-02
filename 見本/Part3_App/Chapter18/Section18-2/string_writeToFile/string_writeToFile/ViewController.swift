//
//  ViewController.swift
//  string_writeToFile
//
//  Created by yoshiyuki oshige on 2017/08/27.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // テキストビューをOutlet接続する
    @IBOutlet weak var textView1: UITextView!
    @IBOutlet weak var textView2: UITextView!
    
    // テキストファイルのパス
    let thePath = NSHomeDirectory()+"/Documents/myTextfile.txt"
    
    // ファイルへの保存
    @IBAction func saveToFile(_ sender: Any) {
        // キーボードを下げる
        view.endEditing(true)
        // 保存するテキストデータ
        let textData = textView1.text
        // テキストデータの保存をトライする
        do {
            try textData?.write(toFile: thePath, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("保存に失敗。\n \(error)")
        }
    }
    
    // ファイルからの読み込み
    @IBAction func readFromFile(_ sender: Any) {
        // テキストデータの読み込みをトライする
        do {
            let textData = try String(contentsOfFile: thePath, encoding: String.Encoding.utf8)
            // 読み込みが成功したならば表示する
            textView2.text = textData
        } catch let error as NSError {
            textView2.text = "読み込みに失敗。\n \(error)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

