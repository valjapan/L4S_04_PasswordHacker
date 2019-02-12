//
//  ViewController.swift
//  L4S_04_PasswordHacker
//
//  Created by 鍋島 由輝 on 2019/02/05.
//  Copyright © 2019 ValJapan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    結果表示ラベル
    @IBOutlet var resultLabel1: UILabel! //右から1番目
    @IBOutlet var resultLabel2: UILabel! //右から2番目
    @IBOutlet var resultLabel3: UILabel! //右から3番目
    @IBOutlet var resultLabel4: UILabel! //右から4番目

//    カウント用ラベル
    @IBOutlet var countLabel: UILabel!

//    秘密のパスワード
    var password: Int = 1234


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func start() {
//        if password == 0000{
//            NSLog("正解は0000です！")
//        } else if password == 0001{
//
//        }

        //0から9999までループする
        for i in 0...9999 {

            //解析中の数字を表示する
            countLabel.text = String(i)

            //処理を0.0005秒待機する。
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.0005))


            //passwordとiが一致したら...
            if password == i {
                //passwordの桁ごとの数字を入れる配列
                var digits = [Int]()

                for _ in 0...3 {
                    digits.append(password % 10)
                    password = password / 10
                }

                resultLabel1.text = String(digits[0])
                resultLabel2.text = String(digits[1])
                resultLabel3.text = String(digits[2])
                resultLabel4.text = String(digits[3])

                print("正解は\(i)です！")
                //print("正解は"+String(i)+"です！")でも可能
            }

        }

    }

    @IBAction func reset() {
        //passwordを1234に再設定する
        password = 1234

        //countLabelの表示を元に戻す
        countLabel.text = "「Start」ボタンを押して解析開始"

        //ラベルの表示を全て0に戻す
        resultLabel1.text = "0"
        resultLabel2.text = "0"
        resultLabel3.text = "0"
        resultLabel4.text = "0"
    }



}

