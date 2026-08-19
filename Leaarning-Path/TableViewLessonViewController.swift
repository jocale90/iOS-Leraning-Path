//
//  TableViewLessonViewController.swift
//  Leaarning-Path
//
//  Clase 3: introducción a UITableView.
//

import UIKit

// MARK: - Modelo

/// Un modelo es una representación sencilla de los datos que mostraremos.
/// La vista no debería inventar la información: solo debe recibirla y dibujarla.
private struct LearningTopic {
    let title: String
    let detail: String
    let symbolName: String
}

final class TableViewLessonViewController: UIViewController {

    // MARK: - Datos

    /// Cada elemento de este arreglo se convertirá en una fila de la tabla.
    /// Es `var` porque el usuario puede agregar y eliminar temas.
    private var topics: [LearningTopic] = [
        LearningTopic(title: "Modelo", detail: "La información que queremos mostrar", symbolName: "shippingbox"),
        LearningTopic(title: "DataSource", detail: "Indica cuántas filas hay y crea sus celdas", symbolName: "tray.full"),
        LearningTopic(title: "Delegate", detail: "Responde a acciones como tocar una fila", symbolName: "hand.tap"),
        LearningTopic(title: "IndexPath", detail: "Identifica la sección y la fila", symbolName: "number"),
        LearningTopic(title: "Reutilización", detail: "Recicla celdas para ahorrar memoria", symbolName: "arrow.triangle.2.circlepath")
    ]

    // MARK: - Vistas

    private let introductionLabel: UILabel = {
        let label = UILabel()
        label.text = "UITableView muestra información en una lista vertical. Toca una fila, agrega una nueva o desliza para eliminarla."
        label.font = .systemFont(ofSize: 16)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()

    /// `.insetGrouped` crea una tabla con grupos y bordes redondeados.
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)

    /// El identificador permite pedir una celda reutilizable del mismo tipo.
    private let cellIdentifier = "TopicCell"

    // MARK: - Ciclo de vida

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Clase 3 · UITableView"
        view.backgroundColor = .systemBackground

        configureNavigationBar()
        configureTableView()
        configureLayout()
    }

    // MARK: - Configuración

    private func configureNavigationBar() {
        // Este botón ejecutará `addTopic` cuando el usuario lo toque.
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTopic)
        )
    }

    private func configureTableView() {
        // El dataSource responde preguntas relacionadas con los DATOS.
        tableView.dataSource = self

        // El delegate responde a la INTERACCIÓN del usuario y a la apariencia.
        tableView.delegate = self

        // Registramos el tipo de celda una sola vez antes de solicitar celdas.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    private func configureLayout() {
        view.addSubview(introductionLabel)
        view.addSubview(tableView)

        // Las constraints solo funcionan correctamente cuando esta propiedad es false.
        introductionLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            introductionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            introductionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            introductionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            tableView.topAnchor.constraint(equalTo: introductionLabel.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - Acciones

    @objc private func addTopic() {
        let newTopic = LearningTopic(
            title: "Nueva fila \(topics.count + 1)",
            detail: "Esta fila fue agregada al arreglo",
            symbolName: "plus.circle"
        )

        // Primero modificamos el modelo...
        topics.append(newTopic)

        // ...y luego avisamos a la tabla qué fila debe dibujar.
        let newIndexPath = IndexPath(row: topics.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
        tableView.scrollToRow(at: newIndexPath, at: .bottom, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension TableViewLessonViewController: UITableViewDataSource {

    /// UITableView pregunta: "¿Cuántas filas debo mostrar en esta sección?".
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        topics.count
    }

    /// UITableView llama a este método cuando necesita dibujar una fila visible.
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        // `dequeueReusableCell` recicla una celda que salió de la pantalla.
        // Así no creamos cientos de vistas si la lista es muy larga.
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        // indexPath.row es la posición de la fila dentro de la sección.
        let topic = topics[indexPath.row]

        // UIListContentConfiguration reúne el texto, detalle e imagen de la celda.
        var content = cell.defaultContentConfiguration()
        content.text = topic.title
        content.secondaryText = topic.detail
        content.image = UIImage(systemName: topic.symbolName)
        content.imageProperties.tintColor = .systemBlue
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    /// Este método habilita el gesto de deslizar hacia la izquierda para eliminar.
    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        guard editingStyle == .delete else { return }

        // El modelo y la interfaz siempre deben quedar sincronizados.
        topics.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}

// MARK: - UITableViewDelegate

extension TableViewLessonViewController: UITableViewDelegate {

    /// Este método se ejecuta cuando el usuario toca una fila.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Quitamos el color de selección después del toque.
        tableView.deselectRow(at: indexPath, animated: true)

        let topic = topics[indexPath.row]
        let message = "Fila: \(indexPath.row)\nSección: \(indexPath.section)\n\n\(topic.detail)"
        let alert = UIAlertController(title: topic.title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Entendido", style: .default))
        present(alert, animated: true)
    }
}
