//
//  HouseHoldInfoView.swift
//  HouseHunter
//
//  Created by Htet Aung Lin on 02/07/2022.
//

import Foundation
import UIKit

//@IBDesignable
class HouseHoldInfoView: UIView {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var bedroomIcon : UIImageView!
    @IBOutlet weak var bedroomCountLabel : UILabel!
    @IBOutlet weak var bathroomIcon : UIImageView!
    @IBOutlet weak var bathroomCountLabel : UILabel!
    @IBOutlet weak var areaMetricIcon : UIImageView!
    @IBOutlet weak var areaMetricValueLabel : UILabel!
    @IBOutlet weak var locationLeftIcon : UIImageView!
    @IBOutlet weak var locationLeftLabel : UILabel!
    @IBOutlet weak var apartmentTypeLabel : UILabel!
    @IBOutlet weak var startingFromTextLabel : UILabel!
    @IBOutlet weak var monthlyPaymentAmountLabel : UILabel!
    @IBOutlet weak var purchasePriceAmountLabel : UILabel!
    @IBOutlet weak var favoriteImageView : UIImageView!
    @IBOutlet weak var houseImage : UIImageView!
    @IBOutlet weak var shadowView : UIView!
    @IBOutlet weak var favoriteImageContainer : UIView!
    @IBOutlet weak var dividerView : UIView!
    @IBOutlet weak var contentInfoOverlayContainerView : UIView!
    @IBOutlet weak var rootContentContainerView : UIView!
    
//    @IBInspectable
//    var isFavorite: Bool = false {
//        didSet {
//            handleFavoriteState(isFavorite)
//        }
//    }
//
//    @IBInspectable
//    var housingType: String = "" {
//        didSet {
//            apartmentTypeLabel.attributedText = NSMutableAttributedString(string: housingType.uppercased()).withKerning(1.5)
//        }
//    }
//
//    @IBInspectable
//    var monthlyPayment: String = "" {
//        didSet {
//            startingFromTextLabel.text = "From".uppercased()
//            monthlyPaymentAmountLabel.attributedText = buildMonthlyPriceAttributedString(price: monthlyPayment)
//        }
//    }
//
//    @IBInspectable
//    var purchasePrice: String = "" {
//        didSet {
//            purchasePriceAmountLabel.text = purchasePrice
//        }
//    }
//
//    @IBInspectable
//    var bedRoomCountDesc : String = "" {
//        didSet {
//            bedroomCountLabel.text = bedRoomCountDesc
//        }
//    }
//
//    @IBInspectable
//    var bathroomCountDesc : String = "" {
//        didSet {
//            bathroomCountLabel.text = bathroomCountDesc
//        }
//    }
//
//    @IBInspectable
//    var areaMetric : String = "" {
//        didSet {
//            areaMetricValueLabel.text = areaMetric
//        }
//    }
//
//    @IBInspectable
//    var location: String = "" {
//        didSet {
//            locationLeftLabel.text = location
//        }
//    }
//
//    @IBInspectable
//    var housePhoto: UIImage? = UIImage(named: "img_apartment_indoor") {
//        didSet {
//            houseImage.image = housePhoto
//        }
//    }
//
    private var data: HouseInfoItem?
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        buildView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        buildView()
    }
    
    private func buildView(){
        Bundle.main.loadNibNamed(String(describing: HouseHoldInfoView.self), owner: self)
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        setUpView()
        initActionListeners()
    }
    
    private func setUpView(){
        startingFromTextLabel.font = .boldSystemFont(ofSize: 12)
        startingFromTextLabel.textColor = UIColor.white
        startingFromTextLabel.textAlignment = .left
        
        apartmentTypeLabel.font = .systemFont(ofSize: 10)
        apartmentTypeLabel.textColor = UIColor.white
        apartmentTypeLabel.textAlignment = .left
                
        monthlyPaymentAmountLabel.font = .systemFont(ofSize: 20)
        monthlyPaymentAmountLabel.textColor = UIColor.white
        monthlyPaymentAmountLabel.textAlignment = .left
        
        purchasePriceAmountLabel.font = .systemFont(ofSize: 18)
        purchasePriceAmountLabel.textColor = UIColor.white
        purchasePriceAmountLabel.textAlignment = .left
                        
        houseImage.contentMode = .scaleAspectFill
        
        rootContentContainerView.backgroundColor = .clear
        rootContentContainerView.layer.cornerRadius = 20
        rootContentContainerView.layer.masksToBounds = true
        
        //Shadow Backdrop
        shadowView.backgroundColor = .white
        shadowView.layer.cornerRadius = 20
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowOpacity = 0.2
        shadowView.layer.shadowOffset = CGSize(width: 2, height: 4.0)
        shadowView.layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        shadowView.layer.shadowRadius = 6.0

        DispatchQueue.main.async {
            // Draw shadow as Image to avoid redrawing which isn't optimal
            self.shadowView.layer.shadowPath = UIBezierPath(roundedRect: self.shadowView.bounds, cornerRadius: self.shadowView.layer.cornerRadius).cgPath
            self.shadowView.layer.shouldRasterize = true
            self.shadowView.layer.rasterizationScale = UIScreen.main.scale
        }
        
        //Overlay Gradient
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let gradientLayer: CAGradientLayer = CAGradientLayer()

            gradientLayer.colors = [
                UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
                UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor,
              ]
            gradientLayer.locations = [0.3, 0.6]
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.frame = self.contentInfoOverlayContainerView.bounds

            self.contentInfoOverlayContainerView.backgroundColor = .clear
            self.contentInfoOverlayContainerView.layer.insertSublayer(gradientLayer, at: 0)
        }
        
        
        bedroomIcon.image = UIImage(systemName: "bed.double.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        bathroomIcon.image = UIImage(systemName: "drop.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        areaMetricIcon.image = UIImage(systemName: "h.square.on.square.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        locationLeftIcon.image = UIImage(systemName: "location.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        
        bedroomCountLabel.font = .systemFont(ofSize: 12)
        bedroomCountLabel.textColor = .white
        
        bathroomCountLabel.font = .systemFont(ofSize: 12)
        bathroomCountLabel.textColor = .white
        
        areaMetricValueLabel.font = .systemFont(ofSize: 12)
        areaMetricValueLabel.textColor = .white
        
        locationLeftLabel.font = .systemFont(ofSize: 12)
        locationLeftLabel.textColor = .white
        
        // Favourite Image Container
        favoriteImageContainer.backgroundColor = .white
        favoriteImageContainer.layer.cornerRadius = favoriteImageContainer.bounds.width / 2
        favoriteImageContainer.layer.shadowOpacity = 0.2
        favoriteImageContainer.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        favoriteImageContainer.layer.shadowColor = UIColor.black.withAlphaComponent(0.9).cgColor
        favoriteImageContainer.layer.shadowRadius = 3.0
        
        DispatchQueue.main.async {
            // Draw shadow as Image to avoid redrawing which isn't optimal
            self.favoriteImageContainer.layer.shadowPath = UIBezierPath(ovalIn: self.favoriteImageContainer.bounds).cgPath

            self.favoriteImageContainer.layer.shouldRasterize = true
            self.favoriteImageContainer.layer.rasterizationScale = UIScreen.main.scale
        }
    }
    
    func bindData(_ data: HouseInfoItem) {
        self.data = data

        startingFromTextLabel.text = "From".uppercased()

        apartmentTypeLabel.attributedText = NSMutableAttributedString(string: data.housingType.uppercased()).withKerning(1.5)
        monthlyPaymentAmountLabel.attributedText = data.monthlyPaymentAttributedString
        purchasePriceAmountLabel.text = data.purchasePrice
        
        bedroomCountLabel.text = data.bedroomCountDesc
        bathroomCountLabel.text = data.ownerCountDescription
        areaMetricValueLabel.text = data.depreciationPerYear
        locationLeftLabel.text = data.houseLocationDescription
        
        houseImage.image = UIImage(named: data.houseImageUrl)
        
        handleFavoriteState(data.isFavorite)
    }
    
    
    //MARK: - Action Handler
    private func handleFavoriteState(_ isFavorite: Bool) {
        if isFavorite {
            favoriteImageView.image = UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.systemRed)
        } else {
            favoriteImageView.image = UIImage(systemName: "heart")?.withRenderingMode(.alwaysOriginal).withTintColor(.black.withAlphaComponent(0.9))
        }
    }
    
   
    private func initActionListeners() {
        handleFavoriteAction()
    }
    
    private func handleFavoriteAction() {
        favoriteImageContainer.isUserInteractionEnabled = true
        let favTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onTapFavourite(_:)))
        favoriteImageContainer.addGestureRecognizer(favTapGesture)
    }
    
    @objc private func onTapFavourite(_ sender: Any) {
        self.data?.isFavorite.toggle()
        self.handleFavoriteState(self.data?.isFavorite ?? false)
    }
    
 
    
    private func buildMonthlyPriceAttributedString(price: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: "")
        let text1 = NSAttributedString(string: "$\(price)", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20),
        ])
        
        let text2 = NSAttributedString(string: "/mths".uppercased(), attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18),
        ])
        
        /// Append attributed text
        attributedString.append(text1)
        attributedString.append(text2)
        return attributedString
    }
}
