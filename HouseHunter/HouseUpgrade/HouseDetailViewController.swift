//
//  HouseDetailViewController2.swift
//  HouseHunter
//
//  Created by Htet Aung Lin on 03/07/2022.
//

import Foundation
import UIKit

class HouseDetailViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let currentPlaceLbl: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Your current place"
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    let newPlaceLbl: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Your new place"
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    let arrowIcon: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(systemName: "arrow.swap")
        return iv
    }()
    
    let termConditionLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Terms & condition applies"
        label.textColor = .separator
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    let upgradeButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .systemTeal
        btn.setTitle("Upgrade Now", for: .normal)
        return btn
    }()
    
    let currentPlaceView: HouseHoldInfoView = HouseHoldInfoView()
    let newPlaceView: HouseHoldInfoView = HouseHoldInfoView()
    
    var currentHouseInfo: HouseInfoItem? {
        didSet{
            if let info = currentHouseInfo {
                currentPlaceView.translatesAutoresizingMaskIntoConstraints = false
                currentPlaceView.bindData(info)
            }
        }
    }
    
    var comparingHouseInfo: HouseInfoItem? {
        didSet {
            if let info = comparingHouseInfo {
                newPlaceView.translatesAutoresizingMaskIntoConstraints = false
                newPlaceView.bindData(info)
            }
        }
    }
    
    override func viewDidLoad() {
        self.navigationItem.title = "Upgrade House"
        self.navigationItem.largeTitleDisplayMode = .never
        
        super.viewDidLoad()
        buildView()
    }
    
    private func buildView(){
        self.view.backgroundColor = .white
        self.view.addSubview(scrollView)
        
        scrollView.isScrollEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.addSubview(currentPlaceLbl)
        scrollView.addSubview(currentPlaceView)
        scrollView.addSubview(arrowIcon)
        scrollView.addSubview(newPlaceLbl)
        scrollView.addSubview(newPlaceView)
        scrollView.addSubview(upgradeButton)
        scrollView.addSubview(termConditionLbl)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            currentPlaceLbl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            currentPlaceLbl.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            currentPlaceLbl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            currentPlaceView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            currentPlaceView.heightAnchor.constraint(equalToConstant: 250),
            currentPlaceView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            currentPlaceView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            currentPlaceView.topAnchor.constraint(equalTo: currentPlaceLbl.bottomAnchor, constant: 8),
            
            arrowIcon.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            arrowIcon.widthAnchor.constraint(equalToConstant: 40),
            arrowIcon.heightAnchor.constraint(equalToConstant: 40),
            arrowIcon.topAnchor.constraint(equalTo: currentPlaceView.bottomAnchor, constant: 20),
            
            newPlaceLbl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            newPlaceLbl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            newPlaceLbl.topAnchor.constraint(equalTo: arrowIcon.bottomAnchor, constant: 10),
            
            newPlaceView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            newPlaceView.heightAnchor.constraint(equalToConstant: 250),
            newPlaceView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            newPlaceView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            newPlaceView.topAnchor.constraint(equalTo: newPlaceLbl.bottomAnchor, constant: 8),
            
            upgradeButton.heightAnchor.constraint(equalToConstant: 44),
            upgradeButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            upgradeButton.trailingAnchor.constraint(equalTo:  self.view.trailingAnchor, constant: -30),
            upgradeButton.topAnchor.constraint(equalTo: newPlaceView.bottomAnchor, constant: 50),
            
            termConditionLbl.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            termConditionLbl.topAnchor.constraint(equalTo: upgradeButton.bottomAnchor, constant: 10)
        ])
    }
}
