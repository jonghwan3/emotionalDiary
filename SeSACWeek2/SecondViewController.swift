//
//  SecondViewController.swift
//  SeSACWeek2
//
//  Created by 박종환 on 2022/07/12.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var emotionFIrst: UILabel!
    @IBOutlet weak var emotionFirstButton: UIButton!
    @IBOutlet var labelCollection: [UILabel]!
    var emotionArray = [0,0,0,0,0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emotionFIrst.text = setUserNickname()
        
        view.backgroundColor = example().0
        emotionFirstButton.setImage(UIImage(named: example().2), for: .normal)
    }
    
    func setUserNickname() -> String {
        let nickname = ["고래밥", "칙촉", "격투가"]
        let select = nickname.randomElement()!
        
        return "저는 \(select)입니다"
    }
    
    // 배경색, 레이블, 이미지
    func example() -> (UIColor, String, String) {
        let color: [UIColor] = [.yellow, .red, .blue]
        let image: [String] = ["sesac_slime6", "sesac_slime7", "sesac_slime8", "sesac_slime5"]
        return (color.randomElement()!, "고래밥", image.randomElement()!)
    }
    
    @IBAction func emotionFirstButtonClicked(_ sender: UIButton) {
        
        print(sender.tag, sender.currentTitle, sender.currentImage)
        let image = UIImage(named: "sesac_slime6")?.withRenderingMode(.alwaysOriginal)
        //let systemImage = UIImage(systemName: <#T##String#>) //애플 시스템 심볼
        //#imageLiteral(
        //let image = #imageLiteral(resourceName: "sesac_slime3")
        sender.setImage(image, for: .normal)
        emotionArray[sender.tag] += 1
        labelCollection[sender.tag].text = "\(emotionArray[sender.tag])"
        showAlertController()
    }
    
    func showAlertController() {
        
        //1. 흰색 바탕: UIAlertController
//        let alert = UIAlertController(title: "타이틀", message: "여기는 메시지가 들어갑니다", preferredStyle: .alert)
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        //2. 버튼 만들기
        let ok = UIAlertAction(title: "확인", style: .destructive, handler: nil)
        let cancle = UIAlertAction(title: "취소버튼입니다.", style: .cancel, handler: nil)
        let web = UIAlertAction(title: "새 창으로 열기", style: .default, handler: nil)
        let copy = UIAlertAction(title: "복사하기", style: .default, handler: nil)
        //3. 1+2
        alert.addAction(copy)
//        alert.addAction(web)
        alert.addAction(cancle)
//        alert.addAction(ok)
        
        //4. present
        present(alert, animated: true, completion: nil)
        
    }
    
}
