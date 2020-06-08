//
//  CollectionCell.swift
//  MBProgressHudSwift
//
//  Created by Ahmed Eid on 6/7/20.
//  Copyright © 2020 Ahmed Eid. All rights reserved.
//


import UIKit
import LBTAComponents

class CollectionCell: UICollectionViewCell {
    
    
    let title: UILabel = {
       let lb = UILabel()
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        addSubview(title)
        title.anchorCenterSuperview()
    }
    
}
