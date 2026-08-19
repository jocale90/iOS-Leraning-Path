//
//  CollectionViewLessonViewController.swift
//  Leaarning-Path
//
//  Clase 4: introducción a UICollectionView.
//

import UIKit

// MARK: - Modelo

/// Cada instancia de `Tool` representa una tarjeta de la cuadrícula.
private struct Tool {
    let name: String
    let description: String
    let symbolName: String
    let color: UIColor
    var isFavorite = false
}

final class CollectionViewLessonViewController: UIViewController {

    // MARK: - Datos

    private var tools: [Tool] = [
        Tool(name: "Xcode", description: "Editor", symbolName: "hammer.fill", color: .systemBlue),
        Tool(name: "Swift", description: "Lenguaje", symbolName: "swift", color: .systemOrange),
        Tool(name: "UIKit", description: "Interfaz", symbolName: "iphone", color: .systemIndigo),
        Tool(name: "Git", description: "Versiones", symbolName: "arrow.triangle.branch", color: .systemRed),
        Tool(name: "Debug", description: "Errores", symbolName: "ladybug.fill", color: .systemGreen),
        Tool(name: "Tests", description: "Calidad", symbolName: "checkmark.seal.fill", color: .systemPurple)
    ]

    // MARK: - Vistas

    private let introductionLabel: UILabel = {
        let label = UILabel()
        label.text = "UICollectionView organiza celdas con un layout. Aquí usamos dos columnas. Toca una tarjeta para marcarla como favorita."
        label.font = .systemFont(ofSize: 16)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()

    private let collectionView: UICollectionView

    // Usamos la misma constante al registrar y reutilizar nuestra celda.
    private let cellIdentifier = "ToolCell"

    // MARK: - Inicialización

    init() {
        // El layout define cómo se acomodan las celdas.
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 12

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) no se usa porque esta pantalla se crea con código")
    }

    // MARK: - Ciclo de vida

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Clase 4 · UICollectionView"
        view.backgroundColor = .systemBackground

        configureCollectionView()
        configureLayout()
    }

    // MARK: - Configuración

    private func configureCollectionView() {
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self

        // A diferencia de la clase anterior, aquí registramos una celda personalizada.
        collectionView.register(ToolCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }

    private func configureLayout() {
        view.addSubview(introductionLabel)
        view.addSubview(collectionView)

        introductionLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            introductionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            introductionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            introductionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            collectionView.topAnchor.constraint(equalTo: introductionLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension CollectionViewLessonViewController: UICollectionViewDataSource {

    /// CollectionView pregunta cuántos elementos existen en la sección.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tools.count
    }

    /// CollectionView llama a este método para cada celda que aparece en pantalla.
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellIdentifier,
            for: indexPath
        ) as? ToolCollectionViewCell else {
            // Este error indicaría que registramos un tipo de celda incorrecto.
            fatalError("No se pudo crear ToolCollectionViewCell")
        }

        let tool = tools[indexPath.item]
        cell.configure(with: tool)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CollectionViewLessonViewController: UICollectionViewDelegate {

    /// `didSelectItemAt` detecta qué tarjeta tocó el usuario.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Cambiamos el modelo y recargamos solamente la celda afectada.
        tools[indexPath.item].isFavorite.toggle()
        collectionView.reloadItems(at: [indexPath])
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CollectionViewLessonViewController: UICollectionViewDelegateFlowLayout {

    /// Calculamos el ancho para mostrar exactamente dos tarjetas por fila.
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let spaceBetweenCells: CGFloat = 12
        let availableWidth = collectionView.bounds.width - spaceBetweenCells
        let cellWidth = floor(availableWidth / 2)
        return CGSize(width: cellWidth, height: 170)
    }
}

// MARK: - Celda personalizada

/// Una celda personalizada nos permite decidir exactamente qué vistas contiene cada tarjeta.
private final class ToolCollectionViewCell: UICollectionViewCell {

    private let iconView = UIImageView()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let favoriteImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAppearance()
        configureSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) no se usa porque la celda se crea con código")
    }

    private func configureAppearance() {
        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.cornerRadius = 16
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray5.cgColor

        // La sombra pertenece a `layer`, pero no recortamos sus bordes para poder verla.
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.08
        layer.shadowRadius = 6
        layer.shadowOffset = CGSize(width: 0, height: 3)
    }

    private func configureSubviews() {
        iconView.contentMode = .scaleAspectFit

        nameLabel.font = .boldSystemFont(ofSize: 18)
        nameLabel.adjustsFontSizeToFitWidth = true

        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.textColor = .secondaryLabel

        favoriteImageView.tintColor = .systemYellow
        favoriteImageView.contentMode = .scaleAspectFit

        let textStack = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])
        textStack.axis = .vertical
        textStack.spacing = 3

        [iconView, textStack, favoriteImageView].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
            iconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconView.widthAnchor.constraint(equalToConstant: 48),
            iconView.heightAnchor.constraint(equalToConstant: 48),

            favoriteImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            favoriteImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            favoriteImageView.widthAnchor.constraint(equalToConstant: 24),
            favoriteImageView.heightAnchor.constraint(equalToConstant: 24),

            textStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -18)
        ])
    }

    /// Recibe un modelo y actualiza todas las vistas de la celda.
    func configure(with tool: Tool) {
        iconView.image = UIImage(systemName: tool.symbolName)
        iconView.tintColor = tool.color
        nameLabel.text = tool.name
        descriptionLabel.text = tool.description
        favoriteImageView.image = UIImage(systemName: tool.isFavorite ? "star.fill" : "star")
    }

    /// Como las celdas se reutilizan, aquí limpiamos su estado visual temporal.
    override func prepareForReuse() {
        super.prepareForReuse()
        iconView.image = nil
        nameLabel.text = nil
        descriptionLabel.text = nil
        favoriteImageView.image = nil
    }
}
