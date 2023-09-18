//
//  CustomTextField.swift
//  MVVMWithDiffable
//
//  Created by 권현석 on 2023/09/18.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        textColor = .black
        layer.cornerRadius = 8
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
