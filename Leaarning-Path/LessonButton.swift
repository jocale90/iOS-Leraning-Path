//
//  LessonButton.swift
//  Leaarning-Path
//
//  Created by Jose Pernia on 18-06-26.
//

import UIKit

final class LessonButton: UIButton {

    private let iconImageView = UIImageView()
    private let lessonTitleLabel = UILabel()
    private let lessonSubtitleLabel = UILabel()


    init(title: String, subtitle: String, iconName: String) {
        super.init(frame: .zero)
        setupUI(title: title, subtitle: subtitle, iconName: iconName)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI(title: String, subtitle: String, iconName: String) {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 18
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray5.cgColor

        iconImageView.image = UIImage(systemName: iconName)
        iconImageView.tintColor = .systemBlue
        iconImageView.contentMode = .scaleAspectFit

        lessonTitleLabel.text = title
        lessonTitleLabel.font = .boldSystemFont(ofSize: 20)
        lessonTitleLabel.textColor = .label
        lessonTitleLabel.textAlignment = .center

        lessonSubtitleLabel.text = subtitle
        lessonSubtitleLabel.font = .systemFont(ofSize: 14)
        lessonSubtitleLabel.textColor = .secondaryLabel
        lessonSubtitleLabel.textAlignment = .center
        lessonSubtitleLabel.numberOfLines = 0

        let stackView = UIStackView(arrangedSubviews: [
            iconImageView,
            lessonTitleLabel,
            lessonSubtitleLabel
        ])

        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.isUserInteractionEnabled = false

        addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 34),
            iconImageView.widthAnchor.constraint(equalToConstant: 34),

            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -12)
        ])
    }
}
