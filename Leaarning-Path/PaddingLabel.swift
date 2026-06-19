//
//  PaddingLabel.swift
//  Leaarning-Path
//
//  Created by Jose Pernia on 18-06-26.
//

import UIKit

final class PaddingLabel: UILabel {

    private let insets: UIEdgeInsets

    init(
        text: String,
        font: UIFont,
        textColor: UIColor,
        backgroundColor: UIColor,
        insets: UIEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    ) {
        self.insets = insets
        super.init(frame: .zero)

        self.text = text
        self.font = font
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.numberOfLines = 0
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize

        return CGSize(
            width: size.width + insets.left + insets.right,
            height: size.height + insets.top + insets.bottom
        )
    }
}
