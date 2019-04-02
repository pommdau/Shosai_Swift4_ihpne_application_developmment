//
//  ViewController.swift
//  nortificationCenter_keyboard
//
//  Created by yoshiyuki oshige on 2017/08/27.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // テキストファイルのパス
    let thePath = NSHomeDirectory()+"/Documents/myTextfile.txt"
    // テキストビューのframe
    var originalFrame:CGRect?
    // テキストビューとOutlet接続する
    @IBOutlet weak var myTextView: UITextView!
    
    // 編集キャンセルボタン
    @IBAction func cancel(_ sender: Any) {
        // キーボードを下げる
        view.endEditing(true)
        // ファイルから読み込む
        readFromFile()
    }
    
    // ファイル保存ボタン
    @IBAction func saveToFile(_ sender: Any) {
        // キーボードを下げる
        view.endEditing(true)
        // 保存するテキストデータ
        let textData = myTextView.text
        // テキストデータの保存をトライする
        do {
            try textData?.write(toFile: thePath, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("保存に失敗。\n \(error)")
        }
    }
    
    // ファイルからの読み込み
    func readFromFile() {
        // テキストデータの読み込みをトライする
        do {
            let textData = try String(contentsOfFile: thePath, encoding: String.Encoding.utf8)
            // 読み込みが成功したならば表示する
            myTextView.text = textData
        } catch let error as NSError {
            // エラーメッセージを書き込んでいます
            print("読み込みに失敗。\n \(error)")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // テキストビューの元のframeを保存する
        originalFrame = myTextView.frame
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ファイルから読み込む
        readFromFile()
        
        // 通知センターのオブジェクトを作る
        let notification = NotificationCenter.default
        
        // キーボードが登場した
        notification.addObserver(self,
                                 selector: #selector(ViewController.keyboardDidShow(_:)),
                                 name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        // キーボードのframeが変更された
        notification.addObserver(self,
                                 selector: #selector(ViewController.keyboardChangeFrame(_:)),
                                 name: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil)
        // キーボードが退場した
        notification.addObserver(self,
                                 selector: #selector(ViewController.keyboardDidHide(_:)),
                                 name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }
    
    // キーボードが表示されたとき実行
    @objc func keyboardDidShow(_ notification: Notification) {
        // keyboardChangeFrameも発生するのでそちらで処理する。
    }
    
    // キーボードのサイズが変化した
    @objc func keyboardChangeFrame(_ notification: Notification) {
        
        // キーボードのframeを調べる
        let userInfo = (notification as NSNotification).userInfo!
        let keybordFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        // キーボードで隠れないようにテキストビューの高さを変更する
        var textViewFrame = myTextView.frame
        textViewFrame.size.height = keybordFrame.minY - textViewFrame.minY - 5
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

