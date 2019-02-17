//
//  ViewController.swift
//  Section18-2-A
//
//  Created by Hiroki Ikeuchi on 2019/02/17.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var outputTextView: UITextView!
    
    // text file path
    let thePath = NSHomeDirectory() + "/Documents/myTextfile.txt"
    
    // ファイルへの保存
    @IBAction func saveToFile(_ sender: Any) {
        view.endEditing(true)
        let textData = inputTextView.text
        do {
            try textData?.write(toFile: thePath, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("保存に失敗。\n\(error)")
        }
    }
    
    @IBAction func readFromFile(_ sender: Any) {
        // ファイル存在チェック
        let fileManager = FileManager.default
        guard (fileManager.fileExists(atPath: thePath) == true) else {
            return
        }
        
        do {
            let textData = try String(contentsOfFile: thePath, encoding: String.Encoding.utf8)
            outputTextView.text = textData
        } catch let error as NSError {
            outputTextView.text = "読み込みに失敗。\n\(error)"
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

