//
//  MapSearchView.swift
//  Nagaza
//
//  Created by SeungMin on 3/14/24.
//

import UIKit

public final class MapSearchView: NagazaView {
    public lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "검색어를 입력하세요"
        label.font = UIFont.pretendard(size: 15, weight: .regular)
        label.textAlignment = .left
        label.textColor = DSKitAsset.Colors.gray4.color
        return label
    }()
    
    public lazy var searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = DSKitAsset.Images.imgSearch.image
        return imageView
    }()
    
    public override func makeUI() {
        self.backgroundColor = DSKitAsset.Colors.white.color
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        
        self.addSubview(searchImageView)
        searchImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(23)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        
        self.addSubview(textLabel)
        textLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(22)
            $0.trailing.equalTo(searchImageView.snp.leading).offset(-16)
            $0.centerY.equalToSuperview()
        }
    }
}
