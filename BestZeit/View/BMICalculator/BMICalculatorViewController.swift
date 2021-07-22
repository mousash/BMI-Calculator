//
//  BMICalculatorViewController.swift
//  BestZeit
//
//  Created by Mousa on 22.07.21.
//

import UIKit

class BMICalculatorViewController: UIViewController {

    @IBOutlet weak var headerView: CustomHeader!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var doneButton: CustomButton!
    
    let viewModel = BMICalculatorViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        headerView.titleLabel.text = "BMI \nCalculator"
        genderLabel.text = "Gender"

        genderSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        genderSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        genderSegment.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        genderSegment.backgroundColor = UIColor.white
        
        genderSegment.layer.borderWidth = 1
        heightLabel.text = "Height"
        doneButton.titleText = "Show Result"
    }

    
    @IBAction func doneButtonAction(_ sender: Any) {
    }
}
