//
//  UIKitBasicsViewController.swift
//  Leaarning-Path
//
//  Created by Jose Pernia on 18-06-26.
//

import UIKit

final class UIKitBasicsViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentStack = UIStackView()

    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()

    private let nameTextField = UITextField()
    private let actionButton = UIButton(type: .system)
    private let resultLabel = UILabel()

    private let demoSwitch = UISwitch()
    private let switchStatusLabel = UILabel()

    private let slider = UISlider()
    private let sliderValueLabel = UILabel()

    private let segmentedControl = UISegmentedControl(items: ["UIKit", "SwiftUI", "Both"])
    private let segmentedLabel = UILabel()

    private let imageView = UIImageView()

    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private let loadingButton = UIButton(type: .system)

    private let stepper = UIStepper()
    private let stepperLabel = UILabel()

    private let textView = UITextView()

    private let tableView = UITableView()
    private let tableItems = [
        "UILabel",
        "UIButton",
        "UITextField",
        "UISwitch",
        "UISlider",
        "UISegmentedControl",
        "UIImageView",
        "UITableView"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Clase 1"
        view.backgroundColor = .systemBackground

        setupScrollView()
        setupStackView()
        setupUIElements()
        setupTableView()
        setupActions()
    }

    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupStackView() {
        scrollView.addSubview(contentStack)

        contentStack.axis = .vertical
        contentStack.spacing = 20
        contentStack.alignment = .fill
        contentStack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 24),
            contentStack.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor, constant: 20),
            contentStack.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor, constant: -20),
            contentStack.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -24)
        ])
    }

    private func setupUIElements() {
        setupHeader()
        setupTextFieldAndButton()
        setupSwitch()
        setupSlider()
        setupSegmentedControl()
        setupImageView()
        setupActivityIndicator()
        setupStepper()
        setupTextView()

        contentStack.addArrangedSubview(makeSectionTitle("UITableView"))
        contentStack.addArrangedSubview(tableView)
    }

    private func setupHeader() {
        titleLabel.text = "Elementos básicos de UIKit"
        titleLabel.font = .boldSystemFont(ofSize: 28)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0

        descriptionLabel.text = "Esta pantalla muestra componentes visuales comunes usados en apps iOS con UIKit."
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.textColor = .secondaryLabel
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0

        contentStack.addArrangedSubview(titleLabel)
        contentStack.addArrangedSubview(descriptionLabel)
    }

    private func setupTextFieldAndButton() {
        contentStack.addArrangedSubview(makeSectionTitle("UILabel + UITextField + UIButton"))

        nameTextField.placeholder = "Escribe tu nombre"
        nameTextField.borderStyle = .roundedRect
        nameTextField.autocapitalizationType = .words

        actionButton.setTitle("Saludar", for: .normal)
        actionButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        actionButton.backgroundColor = .systemBlue
        actionButton.tintColor = .white
        actionButton.layer.cornerRadius = 10
        actionButton.heightAnchor.constraint(equalToConstant: 48).isActive = true

        resultLabel.text = "Resultado aparecerá aquí"
        resultLabel.textAlignment = .center
        resultLabel.textColor = .secondaryLabel
        resultLabel.numberOfLines = 0

        contentStack.addArrangedSubview(nameTextField)
        contentStack.addArrangedSubview(actionButton)
        contentStack.addArrangedSubview(resultLabel)
    }

    private func setupSwitch() {
        contentStack.addArrangedSubview(makeSectionTitle("UISwitch"))

        let row = UIStackView()
        row.axis = .horizontal
        row.alignment = .center
        row.distribution = .equalSpacing

        switchStatusLabel.text = "Modo activado: No"
        switchStatusLabel.font = .systemFont(ofSize: 16)

        row.addArrangedSubview(switchStatusLabel)
        row.addArrangedSubview(demoSwitch)

        contentStack.addArrangedSubview(row)
    }

    private func setupSlider() {
        contentStack.addArrangedSubview(makeSectionTitle("UISlider"))

        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50

        sliderValueLabel.text = "Valor del slider: 50"
        sliderValueLabel.textAlignment = .center

        contentStack.addArrangedSubview(slider)
        contentStack.addArrangedSubview(sliderValueLabel)
    }

    private func setupSegmentedControl() {
        contentStack.addArrangedSubview(makeSectionTitle("UISegmentedControl"))

        segmentedControl.selectedSegmentIndex = 0

        segmentedLabel.text = "Seleccionado: UIKit"
        segmentedLabel.textAlignment = .center

        contentStack.addArrangedSubview(segmentedControl)
        contentStack.addArrangedSubview(segmentedLabel)
    }

    private func setupImageView() {
        contentStack.addArrangedSubview(makeSectionTitle("UIImageView"))

        imageView.image = UIImage(systemName: "iphone")
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        contentStack.addArrangedSubview(imageView)
    }

    private func setupActivityIndicator() {
        contentStack.addArrangedSubview(makeSectionTitle("UIActivityIndicatorView"))

        activityIndicator.hidesWhenStopped = true

        loadingButton.setTitle("Mostrar Loading", for: .normal)
        loadingButton.backgroundColor = .systemGreen
        loadingButton.tintColor = .white
        loadingButton.layer.cornerRadius = 10
        loadingButton.heightAnchor.constraint(equalToConstant: 48).isActive = true

        contentStack.addArrangedSubview(activityIndicator)
        contentStack.addArrangedSubview(loadingButton)
    }

    private func setupStepper() {
        contentStack.addArrangedSubview(makeSectionTitle("UIStepper"))

        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.value = 0

        stepperLabel.text = "Cantidad: 0"
        stepperLabel.textAlignment = .center

        let row = UIStackView()
        row.axis = .horizontal
        row.alignment = .center
        row.distribution = .equalSpacing

        row.addArrangedSubview(stepperLabel)
        row.addArrangedSubview(stepper)

        contentStack.addArrangedSubview(row)
    }

    private func setupTextView() {
        contentStack.addArrangedSubview(makeSectionTitle("UITextView"))

        textView.text = "Este es un UITextView. Sirve para mostrar o escribir textos más largos."
        textView.font = .systemFont(ofSize: 16)
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.systemGray4.cgColor
        textView.layer.cornerRadius = 10
        textView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        contentStack.addArrangedSubview(textView)
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.systemGray4.cgColor
        tableView.layer.cornerRadius = 10
        tableView.heightAnchor.constraint(equalToConstant: 360).isActive = true
    }

    private func setupActions() {
        actionButton.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
        demoSwitch.addTarget(self, action: #selector(didChangeSwitch), for: .valueChanged)
        slider.addTarget(self, action: #selector(didChangeSlider), for: .valueChanged)
        segmentedControl.addTarget(self, action: #selector(didChangeSegment), for: .valueChanged)
        loadingButton.addTarget(self, action: #selector(didTapLoadingButton), for: .touchUpInside)
        stepper.addTarget(self, action: #selector(didChangeStepper), for: .valueChanged)
    }

    @objc private func didTapActionButton() {
        let name = nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)

        if let name, !name.isEmpty {
            resultLabel.text = "Hola, \(name). Bienvenido a UIKit 🚀"
            resultLabel.textColor = .label
        } else {
            resultLabel.text = "Por favor escribe un nombre."
            resultLabel.textColor = .systemRed
        }

        view.endEditing(true)
    }

    @objc private func didChangeSwitch() {
        switchStatusLabel.text = demoSwitch.isOn ? "Modo activado: Sí" : "Modo activado: No"
    }

    @objc private func didChangeSlider() {
        let value = Int(slider.value)
        sliderValueLabel.text = "Valor del slider: \(value)"
    }

    @objc private func didChangeSegment() {
        let selectedTitle = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex) ?? ""
        segmentedLabel.text = "Seleccionado: \(selectedTitle)"
    }

    @objc private func didTapLoadingButton() {
        if activityIndicator.isAnimating {
            activityIndicator.stopAnimating()
            loadingButton.setTitle("Mostrar Loading", for: .normal)
        } else {
            activityIndicator.startAnimating()
            loadingButton.setTitle("Ocultar Loading", for: .normal)
        }
    }

    @objc private func didChangeStepper() {
        stepperLabel.text = "Cantidad: \(Int(stepper.value))"
    }

    private func makeSectionTitle(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }
}

extension UIKitBasicsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableItems.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.text = tableItems[indexPath.row]
        content.secondaryText = "Elemento básico de UIKit"
        content.image = UIImage(systemName: "square.grid.2x2")
        cell.contentConfiguration = content

        return cell
    }
}

extension UIKitBasicsViewController: UITableViewDelegate {

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)

        let selectedItem = tableItems[indexPath.row]

        let alert = UIAlertController(
            title: selectedItem,
            message: "Seleccionaste \(selectedItem)",
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "OK", style: .default))

        present(alert, animated: true)
    }
}
