//
//  HomeViewController.swift
//  Leaarning-Path
//
//  Created by Jose Pernia on 18-06-26.
//

import UIKit

final class HomeViewController: UIViewController {

    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let gridStackView = UIStackView()
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Mentoría iOS"
        view.backgroundColor = .systemBackground

        setupUI()
        setupGrid()
    }

    private func setupUI() {
        titleLabel.text = "Roadmap UIKit"
        titleLabel.font = .boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0

        subtitleLabel.text = "Selecciona una clase para comenzar"
        subtitleLabel.font = .systemFont(ofSize: 17)
        subtitleLabel.textColor = .secondaryLabel
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0

        gridStackView.axis = .vertical
        gridStackView.spacing = 16
        gridStackView.distribution = .fillEqually

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(gridStackView)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        gridStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),

            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),

            gridStackView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 32),
            gridStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            gridStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            gridStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ])
    }

    private func setupGrid() {
        let class1Button = LessonButton(
            title: "Clase 1",
            subtitle: "UIKit básico",
            iconName: "iphone"
        )

        let class2Button = LessonButton(
            title: "Clase 2",
            subtitle: "Git básico",
            iconName: "terminal"
        )

        let class3Button = LessonButton(
            title: "Clase 3",
            subtitle: "UITableView",
            iconName: "list.bullet"
        )

        let class4Button = LessonButton(
            title: "Clase 4",
            subtitle: "UICollectionView",
            iconName: "square.grid.2x2"
        )

        let class5Button = LessonButton(
            title: "Clase 5",
            subtitle: "Próximamente",
            iconName: "lock"
        )

        let class6Button = LessonButton(
            title: "Clase 6",
            subtitle: "Próximamente",
            iconName: "lock"
        )

        let class7Button = LessonButton(
            title: "Clase 7",
            subtitle: "Próximamente",
            iconName: "lock"
        )

        let class8Button = LessonButton(
            title: "Clase 8",
            subtitle: "Próximamente",
            iconName: "lock"
        )

        let class9Button = LessonButton(
            title: "Clase 9",
            subtitle: "Próximamente",
            iconName: "lock"
        )

        let class10Button = LessonButton(
            title: "Clase 10",
            subtitle: "Próximamente",
            iconName: "lock"
        )

        let class11Button = LessonButton(
            title: "Clase 11",
            subtitle: "Próximamente",
            iconName: "lock"
        )

        let class12Button = LessonButton(
            title: "Clase 12",
            subtitle: "Próximamente",
            iconName: "lock"
        )

        let class13Button = LessonButton(
            title: "Clase 13",
            subtitle: "Próximamente",
            iconName: "lock"
        )

        let class14Button = LessonButton(
            title: "Clase 14",
            subtitle: "Network",
            iconName: "lock"
        )

        class1Button.addTarget(self, action: #selector(openClass1), for: .touchUpInside)
        class2Button.addTarget(self, action: #selector(openClass2), for: .touchUpInside)
        class3Button.addTarget(self, action: #selector(openClass3), for: .touchUpInside)
        class4Button.addTarget(self, action: #selector(openClass4), for: .touchUpInside)
        class5Button.addTarget(self, action: #selector(showComingSoon), for: .touchUpInside)
        class6Button.addTarget(self, action: #selector(showComingSoon), for: .touchUpInside)
        class7Button.addTarget(self, action: #selector(showComingSoon), for: .touchUpInside)
        class8Button.addTarget(self, action: #selector(showComingSoon), for: .touchUpInside)
        class9Button.addTarget(self, action: #selector(showComingSoon), for: .touchUpInside)
        class10Button.addTarget(self, action: #selector(showComingSoon), for: .touchUpInside)
        class11Button.addTarget(self, action: #selector(showComingSoon), for: .touchUpInside)
        class12Button.addTarget(self, action: #selector(showComingSoon), for: .touchUpInside)
        class13Button.addTarget(self, action: #selector(showComingSoon), for: .touchUpInside)
        class14Button.addTarget(self, action: #selector(showComingSoon), for: .touchUpInside)

        let row1 = makeRow(class1Button, class2Button)
        let row2 = makeRow(class3Button, class4Button)
        let row3 = makeRow(class5Button, class6Button)
        let row4 = makeRow(class7Button, class8Button)
        let row5 = makeRow(class9Button, class10Button)
        let row6 = makeRow(class11Button, class12Button)
        let row7 = makeRow(class13Button, class14Button)

        let rows = [row1, row2, row3, row4, row5, row6, row7]

        rows.forEach { row in
            gridStackView.addArrangedSubview(row)
            row.heightAnchor.constraint(equalToConstant: 150).isActive = true
        }
    }

    private func makeRow(_ firstButton: UIButton, _ secondButton: UIButton) -> UIStackView {
        let row = UIStackView(arrangedSubviews: [firstButton, secondButton])
        row.axis = .horizontal
        row.spacing = 16
        row.distribution = .fillEqually
        return row
    }

    @objc private func openClass1() {
        let viewController = UIKitBasicsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    @objc private func openClass2() {
        let viewController = GitBasicsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    @objc private func openClass3() {
        let viewController = TableViewLessonViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    @objc private func openClass4() {
        let viewController = CollectionViewLessonViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    @objc private func showComingSoon() {
        let alert = UIAlertController(
            title: "Próximamente",
            message: "Esta clase será agregada más adelante.",
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "OK", style: .default))

        present(alert, animated: true)
    }
}
