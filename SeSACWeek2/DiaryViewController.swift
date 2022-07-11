//
//  DiaryViewController.swift
//  SeSACWeek2
//
//  Created by 박종환 on 2022/07/11.
//

import UIKit

class DiaryViewController: UIViewController {
    
    @IBOutlet var labelList: [UILabel]!
    @IBOutlet var buttonList: [UIButton]!
    
    let dictionaryLabel: [String: String] = ["1" : "행복해", "2" : "사랑해", "3" : "좋아해", "4" : "당황해", "5" : "속상해", "6" : "우울해", "7" : "식겁해", "8" : "불편해", "9" : "아쉬워"]
    var dictionaryValue: [String: Int] = ["1" : 0, "2" : 0, "3" : 0, "4" : 0, "5" : 0, "6" : 0, "7" : 0, "8" : 0, "9" : 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize(buttonList, labelList)
    }
    
    func initialize(_ btnList: [UIButton], _ labelList: [UILabel]){
        for (index, label) in labelList.enumerated() {
            label.text = dictionaryLabel[String(index+1)]! + " " + String(dictionaryValue[String(index+1)]!)
        }
        for (index, buttn) in btnList.enumerated() {
            buttn.setTitle(String(index+1), for: .normal)
        }
    }
//    @IBAction func happyButtonClicked(_ sender: Any) {
//        print(happyLabel.text!.index(happyLabel.text!.startIndex, offsetBy: 1))
//        print(happyLabel.text?[happyLabel.text!.index(after: happyLabel.text!.startIndex)])
//        print(happyLabel.text!.suffix(1))
//        var num = Int(happyLabel.text!.suffix(1))
//        var arrayText: Array = Array(happyLabel.text!)
//        var num = Int(String(arrayText[arrayText.count-1]))
//        num! += 1
//        print(String(arrayText) + String(num))
//        print(arrayText)
//        print(arrayText[arrayText.count-1])
//        print(happyLabel.text?[happyLabel.text!.endIndex])
//        var text: String = "abc"
//        print(text + " " + String(1))
//    }
    @IBAction func buttonClicked(_ sender: UIButton) {
        dictionaryValue.updateValue(dictionaryValue[sender.currentTitle!]! + 1, forKey: sender.currentTitle!)
        labelList[Int(sender.currentTitle!)! - 1].text = dictionaryLabel[sender.currentTitle!]! + " " + String(dictionaryValue[sender.currentTitle!]!)
    }
}
