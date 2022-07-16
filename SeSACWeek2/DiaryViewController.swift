//
//  DiaryViewController.swift
//  SeSACWeek2
//
//  Created by 박종환 on 2022/07/11.
//

import UIKit
//굳이?
//enum EmotionList: String {
//    case happy = "행복해"
//    case love = "사랑해"
//    case like = "좋아해"
//    case embarr = "당황해"
//    case soksang = "속상해"
//    case sad = "우울해"
//    case sikgup = "식겁해"
//    case uncomft = "불편해"
//    case ashe = "아쉬워"
//}
class DiaryViewController: UIViewController {
    
    @IBOutlet var labelList: [UILabel]!
    @IBOutlet var buttonList: [UIButton]!
    
    let dictionaryLabel: [Int: String] = [1 : "행복해", 2 : "사랑해", 3 : "좋아해", 4 : "당황해", 5 : "속상해", 6 : "우울해", 7 : "식겁해", 8 : "불편해", 9 : "아쉬워"]
    //MARK: - UserDefaults로 수정
//    var dictionaryValue: [String: Int] = ["1" : 0, "2" : 0, "3" : 0, "4" : 0, "5" : 0, "6" : 0, "7" : 0, "8" : 0, "9" : 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize(){
        for (index, label) in labelList.enumerated() {
            label.text = dictionaryLabel[index+1]! + " " + "\(UserDefaults.standard.integer(forKey: dictionaryLabel[index+1]!))"
        }
//        for (index, buttn) in btnList.enumerated() {
//            buttn.setTitle(String(index+1), for: .normal)
//        }
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
        UserDefaults.standard.set(UserDefaults.standard.integer(forKey:dictionaryLabel[sender.tag]!) + 1, forKey: dictionaryLabel[sender.tag]!)
        labelList[sender.tag-1].text = dictionaryLabel[sender.tag]! + " " + "\(UserDefaults.standard.integer(forKey: dictionaryLabel[sender.tag]!))"
//        dictionaryValue.updateValue(dictionaryValue["\(sender.tag)"]! + 1, forKey: "\(sender.tag)")
//        labelList[Int(sender.currentTitle!)! - 1].text = dictionaryLabel[sender.currentTitle!]! + " " + String(dictionaryValue[sender.currentTitle!]!)
    }
    @IBAction func deleteButtonClicked(_ sender: UIButton) {
        for (key, value) in dictionaryLabel {
            UserDefaults.standard.removeObject(forKey: value)
        }
        initialize()
    }
}
