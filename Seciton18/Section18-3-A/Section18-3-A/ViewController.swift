//
//  ViewController.swift
//  Section18-3-A
//
//  Created by Hiroki Ikeuchi on 2019/02/17.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let thePath = NSHomeDirectory() + "/Documents/myTextfile.txt"
    // テキストビューのframe
    var originalFrame:CGRect?
    @IBOutlet weak var myTextView: UITextView!
    
    // 編集キャンセルボタン
    @IBAction func cancel(_ sender: Any) {
        view.endEditing(true)
        // ファイルから読み込む
        readFromFile()
    }
    
    @IBAction func saveToFile(_ sender: Any) {
        view.endEditing(true)
        let textData = myTextView.text
        do {
            try textData?.write(toFile: thePath, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("保存に失敗。\n\(error)")
        }
    }
    
    // ファイルから読み込む
    func readFromFile() {
        do {
            let textData = try String(contentsOfFile: thePath, encoding: String.Encoding.utf8)
            myTextView.text = textData
        } catch let error as NSError {
            print("読み込みに失敗。\n\(error)")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        originalFrame = myTextView.frame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ////////////////////
        // KeyBoard Methods
        ////////////////////
        
        // 通知センターのオブジェクトを作る
        let notification = NotificationCenter.default
        
        // キーボードが登場した
        notification.addObserver(self,
                                 selector: #selector(ViewController.keyboardDidShow(_:)),
                                 name: Notification.Name.UIKeyboardDidShow,
                                 object: nil)
        // キーボードのframeが変更された
        notification.addObserver(self,
                                 selector: #selector(ViewController.keyboardChangeFrame(_:)),
                                 name: Notification.Name.UIKeyboardDidChangeFrame,
                                 object: nil)
        // キーボードが退場した
        notification.addObserver(self,
                                 selector: #selector(ViewController.keyboardDidHide(_:)),
                                 name: NSNotification.Name.UIKeyboardDidHide,
                                 object: nil)
    }

    // キーボードが表示されたときに実行
    @objc func keyboardDidShow(_ notification: Notification) {
        // keyboardChangeFrameも発生するのでそちらで処理をする
    }
    
    // キーボードのサイズが変化した
    @objc func keyboardChangeFrame(_ notification: Notification) {
        // キーボードのframeを調べる
        let userInfo = (notification as NSNotification).userInfo!
        let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        // キーボードで隠れないようにテキストビューの高さを変更する
        var textViewFrame = myTextView.frame
        textViewFrame.size.height = keyboardFrame.minY - textViewFrame.minY - 5
        myTextView.frame = textViewFrame
    }
    
    // キーボードが退場した
    @objc func keyboardDidHide(_ notification: Notification) {
        // テキストビューのサイズを戻す
        myTextView.frame = originalFrame!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

