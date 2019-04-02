//
//  ViewController.swift
//  uiScrollView_keyboard
//
//  Created by yoshiyuki oshige on 2017/10/03.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // スクロールビュー
    @IBOutlet weak var myScrollView: UIScrollView!
    // スクロールビューのサブビュー
    @IBOutlet weak var contentView: UIView!
    // すべてのテキストフィールドの配列（Outlet Collection）
    @IBOutlet var myTextFields: [UITextField]!
    // 編集中のテキストフィールド
    var editingField:UITextField?
    // 重なっている高さ
    var overlap:CGFloat = 0.0
    var lastOffsetY:CGFloat = 0.0
    
    // 編集開始のデリゲートメソッド
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // 編集中のテキストフィールド
        editingField = textField
    }
    
    // 編集終了のデリゲートメソッド
    func textFieldDidEndEditing(_ textField: UITextField) {
        editingField = nil
    }
    
    // 改行の入力のデリゲートメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true) // キーボードを下げる
        // 改行コードは入力しない
        return false
    }
    
    // ビューのタップ
    @IBAction func tapView(_ sender: Any) {
        view.endEditing(true)  // キーボードを下げる
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // スワイプでスクロールさせたならばキーボードを下げる
        myScrollView.keyboardDismissMode = .onDrag
        
        // スクロールビューの領域を指定する
        let scrollFrame = CGRect(x: 0, y: 20, width: view.frame.width, height: view.frame.height-20)
        myScrollView.frame = scrollFrame
        // コンテンツのサイズを指定する
        let contentRect  = contentView.bounds
        myScrollView.contentSize = CGSize(width: contentRect.width, height:contentRect.height)

        // すべてのテキストフィールドのデリゲートになる
        for fld in myTextFields {
            fld.delegate = self
        }
        
        // デフォルトの通知センターを得る
        let notification = NotificationCenter.default
        
        
        // キーボードのframeが変化した
        notification.addObserver(self,
                                 selector: #selector(ViewController.keyboardChangeFrame(_:)),
                                 name: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil)
        // キーボードが登場した
        notification.addObserver(self,
                                 selector: #selector(ViewController.keyboardWillShow(_:)),
                                 name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        // キーボードが退場した
        notification.addObserver(self,
                                 selector: #selector(ViewController.keyboardDidHide(_:)),
                                 name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }
    
    // キーボードのframeが変化した通知を受けた
    @objc func keyboardChangeFrame(_ notification: Notification) {
        // 編集中のテキストフィールドがない場合は中断する
        guard let fld = editingField else {
            return
        }
        // キーボードのframeを調べる
        let userInfo = (notification as NSNotification).userInfo!
        let keybordFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        // テキストフィールドのframeをキーボードと同じ座標系にする
        let fldFrame = view.convert(fld.frame, from: contentView)
        // 編集中のテキストフィールドがキーボードと重なっていないか調べる
        overlap =  fldFrame.maxY - keybordFrame.minY + 5
        if overlap>0 {
            // キーボードで隠れている分だけスクロールする
            overlap += myScrollView.contentOffset.y
            myScrollView.setContentOffset(CGPoint(x: 0, y: overlap), animated: true)

        }
    }
    
    // キーボードが登場する通知を受けた
    @objc func keyboardWillShow(_ notification: Notification) {
        // 現在のスクロール量を保存しておく
        lastOffsetY = myScrollView.contentOffset.y
    }
    
    // キーボードが退場した通知を受けた
    @objc func keyboardDidHide(_ notification: Notification) {
        // 元に戻すスクロール量を決める
        let baseline =  contentView.bounds.height -  myScrollView.bounds.height
        lastOffsetY = min(baseline, lastOffsetY)
        // スクロールを元に戻す
        myScrollView.setContentOffset(CGPoint(x: 0, y: lastOffsetY), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
