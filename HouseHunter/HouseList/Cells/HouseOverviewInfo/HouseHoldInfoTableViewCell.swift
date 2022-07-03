//
//  HouseHoleInfoTableViewCell.swift
//  HouseHunter
//
//  Created by Htet Aung Lin on 02/07/2022.
//

import UIKit

class HouseHoldInfoTableViewCell: UITableViewCell {
    private let infoView : HouseHoldInfoView = {
        let view = HouseHoldInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    private var data: HouseInfoItem? {
        didSet {
            if let item = data {
                infoView.bindData(item)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        self.contentView.addSubview(infoView)
        NSLayoutConstraint.activate([
            infoView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            infoView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            infoView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            infoView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindData(_ data: HouseInfoItem) {
        self.data = data
    }
}
