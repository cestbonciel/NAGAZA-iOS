//
//  NagazaCollectionViewCell.swift
//  Nagaza
//
//  Created by SeungMin on 3/14/24.
//

import UIKit

public class NagazaCollectionViewCell: UICollectionViewCell {
    var disposeBag = DisposeBag()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
        self.disposeBag = DisposeBag()
        super.prepareForReuse()
    }
    
    open func makeUI() { }
}
