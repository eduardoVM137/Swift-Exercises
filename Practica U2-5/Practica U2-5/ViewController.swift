 
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let ejercicios = ["Cuadrados Perfectos", "Serie Alternada", "Serie Fibonacci", "Mayor y Menor del Arreglo", "Orden Inverso del Arreglo", "Invertir Arreglo In-Situ", "Diagonales de la Matriz", "Suma Matriz Sin Periferia", "Elementos Comunes entre Vectores"]

        for (index, ejercicio) in ejercicios.enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(ejercicio, for: .normal)
            button.tag = index + 1
            button.addTarget(self, action: #selector(handleButtonTap(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }

        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
        ])
    }

    @objc func handleButtonTap(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            cuadradosPerfectos()
        case 2:
            serieAlternada()
        case 3:
            serieFibonacci()
        case 4:
            mayorYMenorArreglo()
        case 5:
            ordenInversoArreglo()
        case 6:
            invertirArregloInSitu()
        case 7:
            diagonalesMatriz()
        case 8:
            sumaMatrizSinPeriferia()
        case 9:
            elementosComunesVectores()
        default:
            break
        }
    }

    func cuadradosPerfectos() {
        let alert = UIAlertController(title: "Cuadrados Perfectos", message: "Ingrese el valor de N", preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Valor de N" }
        alert.addAction(UIAlertAction(title: "Calcular", style: .default, handler: { _ in
            if let inputN = alert.textFields?[0].text, let n = Int(inputN), n > 0 {
                var result = ""
                for i in 1...n {
                    result += "\(i * i)\n"
                }
                self.showResult(message: result)
            } else {
                self.showResult(message: "Entrada no válida")
            }
        }))
        present(alert, animated: true, completion: nil)
    }

    func serieAlternada() {
        let alert = UIAlertController(title: "Serie Alternada", message: "Ingrese el valor de N", preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Valor de N" }
        alert.addAction(UIAlertAction(title: "Calcular", style: .default, handler: { _ in
            if let inputN = alert.textFields?[0].text, let n = Int(inputN), n > 0 {
                var result = ""
                var left = 1
                var right = n
                while left <= right {
                    result += "\(left) "
                    if left != right {
                        result += "\(right) "
                    }
                    left += 1
                    right -= 1
                }
                self.showResult(message: result)
            } else {
                self.showResult(message: "Entrada no válida")
            }
        }))
        present(alert, animated: true, completion: nil)
    }

    func serieFibonacci() {
        let alert = UIAlertController(title: "Serie Fibonacci", message: "Ingrese el valor de N", preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Valor de N" }
        alert.addAction(UIAlertAction(title: "Calcular", style: .default, handler: { _ in
            if let inputN = alert.textFields?[0].text, let n = Int(inputN), n > 0 {
                var fibonacci = [1, 1]
                while fibonacci.count < n {
                    let nextValue = fibonacci[fibonacci.count - 1] + fibonacci[fibonacci.count - 2]
                    fibonacci.append(nextValue)
                }
                let result = fibonacci.prefix(n).map { String($0) }.joined(separator: ", ")
                self.showResult(message: result)
            } else {
                self.showResult(message: "Entrada no válida")
            }
        }))
        present(alert, animated: true, completion: nil)
    }

    func mayorYMenorArreglo() {
        let alert = UIAlertController(title: "Mayor y Menor del Arreglo", message: "Ingrese los elementos del arreglo separados por comas", preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Valores del arreglo" }
        alert.addAction(UIAlertAction(title: "Calcular", style: .default, handler: { _ in
            if let inputArray = alert.textFields?[0].text {
                let array = inputArray.split(separator: ",").compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
                if array.isEmpty {
                    self.showResult(message: "Entrada no válida")
                    return
                }
                let minValue = array.min()!
                let maxValue = array.max()!
                let result = "Menor: \(minValue)\nMayor: \(maxValue)"
                self.showResult(message: result)
            } else {
                self.showResult(message: "Entrada no válida")
            }
        }))
        present(alert, animated: true, completion: nil)
    }

    func ordenInversoArreglo() {
        let alert = UIAlertController(title: "Orden Inverso del Arreglo", message: "Ingrese los elementos del arreglo separados por comas", preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Valores del arreglo" }
        alert.addAction(UIAlertAction(title: "Invertir", style: .default, handler: { _ in
            if let inputArray = alert.textFields?[0].text {
                let array = inputArray.split(separator: ",").compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
                if array.isEmpty {
                    self.showResult(message: "Entrada no válida")
                    return
                }
                let result = array.reversed().map { String($0) }.joined(separator: "\n")
                self.showResult(message: result)
            } else {
                self.showResult(message: "Entrada no válida")
            }
        }))
        present(alert, animated: true, completion: nil)
    }

    func invertirArregloInSitu() {
        let alert = UIAlertController(title: "Invertir Arreglo In-Situ", message: "Ingrese los elementos del arreglo separados por comas", preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Valores del arreglo" }
        alert.addAction(UIAlertAction(title: "Invertir", style: .default, handler: { _ in
            if let inputArray = alert.textFields?[0].text {
                var array = inputArray.split(separator: ",").compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
                if array.isEmpty {
                    self.showResult(message: "Entrada no válida")
                    return
                }
                let n = array.count
                for i in 0..<(n / 2) {
                    array.swapAt(i, n - i - 1)
                }
                let result = array.map { String($0) }.joined(separator: ", ")
                self.showResult(message: result)
            } else {
                self.showResult(message: "Entrada no válida")
            }
        }))
        present(alert, animated: true, completion: nil)
    }

    func diagonalesMatriz() {
        let alert = UIAlertController(title: "Diagonales de la Matriz", message: "Ingrese los elementos de la matriz cuadrada separados por comas (una sola fila)\nEj: 1,2,3,4 para una matriz 2x2", preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Valores de la matriz" }
        alert.addAction(UIAlertAction(title: "Calcular", style: .default, handler: { _ in
            if let inputMatrix = alert.textFields?[0].text {
                let elements = inputMatrix.split(separator: ",").compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
                let n = Int(sqrt(Double(elements.count)))
                if n * n != elements.count {
                    self.showResult(message: "Entrada no válida")
                    return
                }
                var dp = [Int]()
                var di = [Int]()
                for i in 0..<n {
                    dp.append(elements[i * n + i])
                    di.append(elements[i * n + (n - i - 1)])
                }
                let result = "DP: \(dp.map { String($0) }.joined(separator: ", "))\nDI: \(di.map { String($0) }.joined(separator: ", "))"
                self.showResult(message: result)
            } else {
                self.showResult(message: "Entrada no válida")
            }
        }))
        present(alert, animated: true, completion: nil)
    }

    func sumaMatrizSinPeriferia() {//por solucionar
        let alert = UIAlertController(title: "Suma Matriz Sin Periferia", message: "Ingrese los elementos de la matriz cuadrada separados por comas (una sola fila)\nEj: 1,2,3,4 para una matriz 2x2", preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Valores de la matriz" }
        alert.addAction(UIAlertAction(title: "Calcular", style: .default, handler: { _ in
            if let inputMatrix = alert.textFields?[0].text {
                let elements = inputMatrix.split(separator: ",").compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
                let n = Int(sqrt(Double(elements.count)))
                if n * n != elements.count {
                    self.showResult(message: "Entrada no válida")
                    return
                }
                var sum = 0
                for i in 1..<(n - 1) {
                    for j in 1..<(n - 1) {
                        sum += elements[i * n + j]
                    }
                }
                self.showResult(message: "La suma de los elementos no periféricos es: \(sum)")
            } else {
                self.showResult(message: "Entrada no válida")
            }
        }))
        present(alert, animated: true, completion: nil)
    }

    func elementosComunesVectores() {
        let alert = UIAlertController(title: "Elementos Comunes entre Vectores", message: "Ingrese los elementos del vector A y B separados por comas", preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Valores del vector A" }
        alert.addTextField { $0.placeholder = "Valores del vector B" }
        alert.addAction(UIAlertAction(title: "Calcular", style: .default, handler: { _ in
            if let inputA = alert.textFields?[0].text, let inputB = alert.textFields?[1].text {
                let vectorA = Set(inputA.split(separator: ",").compactMap { Int($0.trimmingCharacters(in: .whitespaces)) })
                let vectorB = Set(inputB.split(separator: ",").compactMap { Int($0.trimmingCharacters(in: .whitespaces)) })
                let intersection = vectorA.intersection(vectorB)
                let result = intersection.isEmpty ? "No hay elementos comunes" : intersection.map { String($0) }.joined(separator: "\n")
                self.showResult(message: result)
            } else {
                self.showResult(message: "Entrada no válida")
            }
        }))
        present(alert, animated: true, completion: nil)
    }

    func showResult(message: String) {
        let resultAlert = UIAlertController(title: "Resultado", message: message, preferredStyle: .alert)
        resultAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(resultAlert, animated: true, completion: nil)
    }
}
