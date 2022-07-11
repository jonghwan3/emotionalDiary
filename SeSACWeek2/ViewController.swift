//
//  ViewController.swift
//  SeSACWeek2
//
//  Created by 박종환 on 2022/07/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var orangeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orangeView.layer.cornerRadius = orangeView.frame.width / 2
        
        orangeView.clipsToBounds = false
        orangeView.layer.maskedCorners = [.layerMinXMinYCorner]
        orangeView.layer.cornerRadius = orangeView.frame.width / 2
        //clipsToBounds vs cornerRadius vs shadow
    }

    @IBAction func sliderValueChanged(_ sender: Any) {
        print("sliderChanged")
    }
    
}
