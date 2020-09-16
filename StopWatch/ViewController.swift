//
//  ViewController.swift
//  StopWatch
//
//  Created by 井戸海里 on 2020/09/05.
//  Copyright © 2020 IdoUmi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //ラベルの宣言
    @IBOutlet var label:UILabel!
    
    @IBOutlet var perfectLabel:UILabel!
    //countという変数を宣言（小数）
    var count:Float = 0.00
    //timerの宣言
    var timer:Timer = Timer()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //upメソッドを作る
    @objc func up(){
        //countを0.01たす
        count = count + 0.01
        //ラベルに小数点以下２桁まで表示
        label.text = String(format:"%.2f",count)
        
        
    }
    //hanteiメソッド
    @objc func hantei(){
        
        switch count {
            
        case Float(9.80)...Float(10.12):
            
            perfectLabel.text = "PERFECT!"
            
        case Float(9.70)...Float(10.30):
            
            perfectLabel.text = "GREAT"
            
        case Float(9.50)...Float(10.50):
            
            perfectLabel.text = "GOOD"
            
        default:
            
            perfectLabel.text = "BAD"
            
            }
            
        
        
        
    }
    //ボタンの宣言
    @IBAction func start(){
        
       
        
        if !timer.isValid{
            //タイマーが動いていなかったら動かす処理
            timer = Timer.scheduledTimer(timeInterval:0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true
            )
        }
    }
    
    @IBAction func stop(){
        //評価の表示スタート
        perfectLabel.isHidden = false
        //タイマーが動いていたら
        if timer.isValid{
            //ストップさせる
            timer.invalidate()
            
            self.hantei()
        }
        
    }
    @IBAction func reset(){
        //タイマーが動いていたら
               if timer.isValid{
                   //ストップさせる
                   timer.invalidate()
                
               }
        //countを初期化
        count = 0.0
        //ラベルを0.0にする
        label.text = String(count)
        //評価の表示を消す
        perfectLabel.isHidden = true
    }


}

