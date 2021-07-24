//
//  BMIResultViewController.swift
//  BestZeit
//
//  Created by Mousa on 22.07.21.
//

import UIKit

class BMIResultViewController: UIViewController {

    @IBOutlet weak var headerView: CustomHeader!
    @IBOutlet weak var backButton: CustomButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        headerView.titleLabel.text = "BMI \nResult"
        backButton.titleText = "Back"
        resultLabel.text = result
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
