//
//  SearchTableViewCell.swift
//  Nagaza
//
//  Created by SeungMin on 3/13/24.
//

import UIKit

import Domain
import DSKit

final class SearchTableViewCell: NagazaTableViewCell {
    static let identifier = SearchTableViewCell.description()

    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.alignment = .leading
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 16, weight: .regular)
        label.textAlignment = .center
        label.textColor = DSKitAsset.Colors.black1.color
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 14, weight: .regular)
        label.textAlignment = .center
        label.textColor = DSKitAsset.Colors.gray3.color
        return label
    }()
    
    override func makeUI() {
        contentView.addSubview(labelStackView)
        
        labelStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(35)
            $0.centerY.equalToSuperview()
        }
        
        labelStackView.addArrangedSubviews(
            [titleLabel, subtitleLabel]
        )
    }
    
    func bind(item: Place, keyword: String?) {
        titleLabel.attributedText = item.placeName.toAttributedString(
            with: keyword,
            font: .pretendard(size: 16, weight: .bold),
            color: DSKitAsset.Colors.mainOrange.color
        )
        subtitleLabel.text = item.addressName
    }
}
