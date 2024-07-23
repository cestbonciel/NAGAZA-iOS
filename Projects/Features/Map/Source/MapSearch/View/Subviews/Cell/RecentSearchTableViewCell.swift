//
//  RecentSearchTableViewCell.swift
//  Nagaza
//
//  Created by SeungMin on 3/27/24.
//

import UIKit

import Domain
import DSKit

final class RecentSearchTableViewCell: NagazaTableViewCell {
    static let identifier = RecentSearchTableViewCell.description()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 16, weight: .regular)
        label.textAlignment = .center
        label.textColor = DSKitAsset.Colors.black1.color
        return label
    }()
    
    private let removeButton: UIButton = {
        let button = UIButton()
        button.setImage(DSKitAsset.Images.icX.image, for: .normal)
        return button
    }()
    
    override func makeUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(removeButton)
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(35)
            $0.centerY.equalToSuperview()
        }
        
        removeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
    }
    
    func bind(item: RecentKeyword) {
        titleLabel.text = item.keyword
    }
}

