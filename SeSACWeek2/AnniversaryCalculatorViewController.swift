//
//  AnniversaryCalculatorViewController.swift
//  SeSACWeek2
//
//  Created by 박종환 on 2022/07/13.
//

import UIKit

class AnniversaryCalculatorViewController: UIViewController {

    @IBOutlet var imageViewCollection: [UIImageView]!
    override func viewDidLoad() {
        super.viewDidLoad()
        designDiaryImageView(imageCollection: imageViewCollection)
        dateFormatStyle()
        numberFormatStyle()
    }
    
    func designDiaryImageView(imageCollection: [UIImageView]) {
        for imageView in imageCollection {
            imageView.layer.cornerRadius = 20
            imageView.clipsToBounds = true
        }
    }
    
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
