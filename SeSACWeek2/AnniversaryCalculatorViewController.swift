//
//  AnniversaryCalculatorViewController.swift
//  SeSACWeek2
//
//  Created by 박종환 on 2022/07/13.
//

import UIKit

class AnniversaryCalculatorViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet var imageViewCollection: [UIImageView]!
    @IBOutlet var dateLabelList: [UILabel]!
    override func viewDidLoad() {
        super.viewDidLoad()
        designDiaryImageView(imageCollection: imageViewCollection)
        
        //MARK: - DatePicker 버전에 따른 대응
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            print("버전 14 미만?")
            //preferredDatePickerStyle' is only available in iOS 13.4 or newer 에러로 13.0 버전에서는 해당 코드 실행 안되어, 스토리보드에 wheels로 설정
            //datePicker.preferredDatePickerStyle = .wheels
        }
        //dateFormatStyle()
        //numberFormatStyle()
        //알아보기 쉬운 날짜 + 시간대 (yyyy MM dd hh:mm:ss)
//        let format = DateFormatter()
//        format.dateFormat = "M월 d일, yy년"
//
//        let result = format.string(from: Date())
//        print(result, Date())
//
//        let word = "3월 2일, 19년"
//        let dateResult = format.date(from: word)
//        print(dateResult!)
    }
    //MARK: - DatePicker 선택 시, 해당 날짜로부터 D-day 계산
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        let format = DateFormatter()
        format.dateFormat = "yyyy년\nMM월 dd일"
        let secPDay: Double = 86400 // 60s/1m * 60m/1h * 24h/1d
        var dDay: Double = 100
        for label in dateLabelList {
            label.text = format.string(from: sender.date.addingTimeInterval(secPDay * dDay))
            dDay += 100
        }
    }
    
    func designDiaryImageView(imageCollection: [UIImageView]) {
        for imageView in imageCollection {
            imageView.layer.cornerRadius = 20
            imageView.clipsToBounds = true
        }
    }
    //MARK: - Practice
    func dateFormatStyle() {
        let value = Date()
        
        print(value)
        print(value.formatted())
        print(value.formatted(date: .omitted, time: .shortened))
        print(value.formatted(date: .complete, time: .shortened))
        
        let locale = Locale(identifier: "ko-KR")
        
        let result = value.formatted(.dateTime.locale(locale).day().month(.twoDigits).year())
        print(result)
        
        let result2 = value.formatted(.dateTime.day().month(.twoDigits).year())
        print(result2)
    }
    
    func numberFormatStyle() {
        print(50.formatted(.percent))
        
        print(1345678901.formatted())
        
        print(457821334.formatted(.currency(code: "krw")))
        
        let result = ["올라프", "미키마우스", "뽀로로"].formatted()
        print(result)
    }

}
