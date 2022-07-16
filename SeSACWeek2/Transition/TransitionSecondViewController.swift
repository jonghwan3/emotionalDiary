//
//  TransitionSecondViewController.swift
//  SeSACWeek2
//
//  Created by 박종환 on 2022/07/15.
//

import UIKit

class TransitionSecondViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var mottoTextView: UITextView!
    /*
     1. 앱 켜면 데이터를 불러와 텍스트 뷰에 보여줘야 함
     2. 바뀐 데이터를 저장해줌
     => UserDefault
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TransitionSecondViewController", #function)
        //데이터 불러오기
        if UserDefaults.standard.string(forKey: "nickname") != nil {
            mottoTextView.text = UserDefaults.standard.string(forKey: "nickname")
        } else {
            //기본 문구
            mottoTextView.text = "고래밥"
        }
        //데이터 불러오기 (감정)
        countLabel.text = "\(UserDefaults.standard.integer(forKey: "emotionCount"))"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("TransitionSecondViewController", #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("TransitionSecondViewController", #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("TransitionSecondViewController", #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("TransitionSecondViewController", #function)
    }
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        UserDefaults.standard.set(mottoTextView.text, forKey: "nickname")
        print("저장되었습니다!")
    }
    @IBAction func emotionCountClicked(_ sender: UIButton) {
        var cnt = UserDefaults.standard.integer(forKey: "emotionCount")
        cnt += 1
        UserDefaults.standard.set(cnt, forKey: "emotionCount")
        countLabel.text = "\(UserDefaults.standard.integer(forKey: "emotionCount"))"
    }
    
}
