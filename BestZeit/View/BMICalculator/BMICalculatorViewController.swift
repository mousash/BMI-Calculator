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
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var doneButton: CustomButton!
    lazy var weightView: WeightCollectionView = {
        let weightView = WeightCollectionView()
        weightView.translatesAutoresizingMaskIntoConstraints = false
        return weightView
    }()
    lazy var heightView: HeightCollectionView = {
        let heightView = HeightCollectionView()
        heightView.translatesAutoresizingMaskIntoConstraints = false
        return heightView
    }()

    let viewModel = BMICalculatorViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        addHeightView()
        addWeightView()
    }
    
    private func setupUI() {
        headerView.titleLabel.text = "BMI \nCalculator"
        genderLabel.text = "Gender"
        setupGenderSegment()
        heightLabel.text = "Height"
        weightLabel.text = "Weight"
        doneButton.titleText = "Show Result"
    }
    
    private func addWeightView() {
        view.addSubview(weightView)

        weightView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        weightView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        weightView.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 16).isActive = true
        weightView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        weightView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func addHeightView() {
        view.addSubview(heightView)

        heightView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        heightView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        heightView.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 16).isActive = true
        heightView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func setupGenderSegment() {
        genderSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        genderSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        genderSegment.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)], for: .normal)
        genderSegment.backgroundColor = UIColor.white
        genderSegment.layer.borderWidth = 1
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        guard let heightCenter = heightView.collectionView.centerCellIndexPath?.row else { return }
        guard let weightCenter = weightView.collectionView.centerCellIndexPath?.row else { return }
        viewModel.bmi.height = heightCenter
        viewModel.bmi.weight = weightCenter
        let vc = BMIResultViewController()
        vc.result = String(viewModel.calculateBMI())
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
