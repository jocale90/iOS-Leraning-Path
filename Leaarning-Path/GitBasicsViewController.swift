//
//  GitBasicsViewController.swift
//  Leaarning-Path
//
//  Created by Jose Pernia on 18-06-26.
//

import UIKit

final class GitBasicsViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentStack = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Clase 2"
        view.backgroundColor = .systemBackground

        setupScrollView()
        setupStackView()
        setupContent()
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
        contentStack.spacing = 18
        contentStack.alignment = .fill
        contentStack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 24),
            contentStack.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor, constant: 20),
            contentStack.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor, constant: -20),
            contentStack.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -24)
        ])
    }

    private func setupContent() {
        contentStack.addArrangedSubview(makeTitle("Git básico"))
        contentStack.addArrangedSubview(makeParagraph(
            "Git es una herramienta que nos permite guardar versiones de nuestro código. Es como tener checkpoints de avance en un videojuego."
        ))

        contentStack.addArrangedSubview(makeSectionTitle("Objetivo de la clase"))
        contentStack.addArrangedSubview(makeCard(
            title: "Meta",
            text: "Aprender a crear un repositorio, guardar cambios con commits y subir el proyecto a GitHub."
        ))

        contentStack.addArrangedSubview(makeSectionTitle("Conceptos principales"))

        contentStack.addArrangedSubview(makeCard(
            title: "Working Directory",
            text: "Es la carpeta donde estás modificando tus archivos."
        ))

        contentStack.addArrangedSubview(makeCard(
            title: "Staging Area",
            text: "Es la zona donde preparas los archivos antes de guardarlos definitivamente."
        ))

        contentStack.addArrangedSubview(makeCard(
            title: "Commit",
            text: "Es una foto del estado actual del proyecto. Guarda un punto de avance."
        ))

        contentStack.addArrangedSubview(makeCard(
            title: "Repository",
            text: "Es el lugar donde Git guarda todo el historial del proyecto."
        ))

        contentStack.addArrangedSubview(makeCard(
            title: "Remote",
            text: "Es una copia online del proyecto, normalmente en GitHub, GitLab o Bitbucket."
        ))

        contentStack.addArrangedSubview(makeSectionTitle("Comandos básicos"))

        let commands = """
        git init
        git status
        git add .
        git commit -m "Primer commit"
        git branch
        git checkout -b clase-2-git
        git push
        git pull
        git clone
        """

        contentStack.addArrangedSubview(makeCodeBlock(commands))

        contentStack.addArrangedSubview(makeSectionTitle("Flujo recomendado"))

        let flow = """
        1. Crear o abrir proyecto en Xcode.
        2. Revisar cambios con git status.
        3. Agregar cambios con git add .
        4. Guardar avance con git commit.
        5. Subir a GitHub con git push.
        """

        contentStack.addArrangedSubview(makeCodeBlock(flow))

        contentStack.addArrangedSubview(makeSectionTitle("Tarea práctica"))

        contentStack.addArrangedSubview(makeCard(
            title: "Tarea",
            text: "Subir esta app UIKit a GitHub con mínimo 5 commits. Cada commit debe representar un avance real."
        ))

        contentStack.addArrangedSubview(makeSectionTitle("Ejemplo de commits"))

        let commits = """
        Commit 1: Crea proyecto base UIKit
        Commit 2: Agrega pantalla Home
        Commit 3: Agrega botón Clase 1
        Commit 4: Agrega pantalla Git básico
        Commit 5: Mejora diseño de botones
        """

        contentStack.addArrangedSubview(makeCodeBlock(commits))
    }

    private func makeTitle(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }

    private func makeSectionTitle(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }

    private func makeParagraph(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 17)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }

    private func makeCard(title: String, text: String) -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = .secondarySystemBackground
        containerView.layer.cornerRadius = 14
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.systemGray5.cgColor

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.numberOfLines = 0

        let textLabel = UILabel()
        textLabel.text = text
        textLabel.font = .systemFont(ofSize: 16)
        textLabel.textColor = .secondaryLabel
        textLabel.numberOfLines = 0

        let stackView = UIStackView(arrangedSubviews: [titleLabel, textLabel])
        stackView.axis = .vertical
        stackView.spacing = 6

        containerView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 14),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 14),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -14),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -14)
        ])

        return containerView
    }

    private func makeCodeBlock(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .monospacedSystemFont(ofSize: 15, weight: .regular)
        label.textColor = .label
        label.backgroundColor = .tertiarySystemBackground
        label.numberOfLines = 0
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true

        label.layoutMargins = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)

        return PaddingLabel(
            text: text,
            font: .monospacedSystemFont(ofSize: 15, weight: .regular),
            textColor: .label,
            backgroundColor: .tertiarySystemBackground
        )
    }
}
