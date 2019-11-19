//
//  ViewController.swift
//  UserDefaultProject
//
//  Created by 佐藤一馬 on 2019/11/15.
//  Copyright © 2019年 佐藤一馬. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var colorNumber = 0
    
        //背景色を変えるためのコード
        fileprivate func changeBgColor() {
        switch colorNumber {
        case 0:
            view.backgroundColor = .red
            label.text = "赤"
        case 1:
            view.backgroundColor = .blue
            label.text = "青"
        case 2:
            view.backgroundColor = .green
            label.text = "緑"
        default:
            view.backgroundColor = .white
            label.text = "白"
        }
    }
        override func viewDidLoad(){
                super.viewDidLoad()
            
            //UserDeaultsを取得
            let userDefaults = UserDefaults.standard
            //前回設定された番号を、変数colorNumberに入れる
            colorNumber = userDefaults.integer(forKey: "colorNum")
                
                changeBgColor()
    }
    
    @IBAction func didClickButton(_ sender: UIButton){
        
        if colorNumber >= 3 {
            colorNumber = 0
        }else{
            colorNumber += 1
        }

        changeBgColor()
        
//        1.UserDefaultを取得する
        let userDefaults = UserDefaults.standard
        
        userDefaults.set(colorNumber, forKey: "colorNum")
        
        let savedNumbers = userDefaults.integer(forKey: "colorNum")
        
        print(savedNumbers)
        }

}
