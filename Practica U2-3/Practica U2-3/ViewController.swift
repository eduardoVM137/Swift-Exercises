import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    func setupUI() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let ejercicios = ["Ejercicio 1", "Ejercicio 2", "Ejercicio 3", "Ejercicio 4", "Ejercicio 5", "Ejercicio 6", "Ejercicio 7", "Ejercicio 8", "Ejercicio 9", "Ejercicio 10"]

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
            ejercicio1()
        case 2:
            ejercicio2()
        case 3:
            ejercicio3()
        case 4:
            ejercicio4()
        case 5:
            ejercicio5()
        case 6:
            ejercicio6()
        case 7:
            ejercicio7()
        case 8:
            ejercicio8()
        case 9:
            ejercicio9()
        case 10:
            ejercicio10()
        default:
            break
        }
    }

    func ejercicio1() {
        let alert = UIAlertController(title: "Ejercicio 1", message: "Ingrese el valor de N para imprimir los N cuadrados perfectos", preferredStyle: .alert)
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

    func ejercicio2() {
        let alert = UIAlertController(title: "Ejercicio 2", message: "Ingrese el valor de N para imprimir la serie alternada de 1 a N", preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Valor de N" }
        alert.addAction(UIAlertAction(title: "Calcular", style: .default, handler: { _ in
            if let inputN = alert.textFields?[0].text, let n = Int(inputN), n > 0 {
                var result = ""
                for i in 1...(n / 2) {
                    result += "\(i) \(n - i + 1) "
                }
                if n % 2 != 0 {
                    result += "\(n / 2 + 1)"
                }
                self.showResult(message: result)
            } else {
                self.showResult(message: "Entrada no válida")
            }
        }))
        present(alert, animated: true, completion: nil)
    }

    func ejercicio3() {
        let alert = UIAlertController(title: "Ejercicio 3", message: "Ingrese el valor de N para imprimir los primeros N números de Fibonacci", preferredStyle: .alert)
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

    func ejercicio4() {
        let alert = UIAlertController(title: "Ejercicio 4", message: "Ingrese los elementos del arreglo separados por comas", preferredStyle: .alert)
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

    func ejercicio5() {
        let alert = UIAlertController(title: "Ejercicio 5", message: "Ingrese los elementos del arreglo separados por comas", preferredStyle: .alert)
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

    func ejercicio6() {
        let alert = UIAlertController(title: "Ejercicio 6", message: "Ingrese los elementos del arreglo separados por comas", preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Valores del arreglo" }
        alert.addAction(UIAlertAction(title: "Invertir In-Situ", style: .default, handler: { _ in
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

    func ejercicio7() {
        let alert = UIAlertController(title: "Ejercicio 7", message: "Ingrese los elementos de la matriz cuadrada separados por comas (una sola fila)\nEj: 1,2,3,4 para una matriz 2x2", preferredStyle: .alert)
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

    func ejercicio8() {
        let alert = UIAlertController(title: "Ejercicio 8", message: "Ingrese los elementos de la matriz cuadrada separados por comas (una sola fila)\nEj: 1,2,3,4 para una matriz 2x2", preferredStyle: .alert)
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

    func ejercicio9() {
        let alert = UIAlertController(title: "Ejercicio 9", message: "Ingrese los elementos del vector A y B separados por comas", preferredStyle: .alert)
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

    func ejercicio10() {
        let alert = UIAlertController(title: "Ejercicio 10", message: "Ingrese los elementos del vector separados por comas", preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Valores del vector" }
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

    func showResult(message: String) {
        let resultAlert = UIAlertController(title: "Resultado", message: message, preferredStyle: .alert)
        resultAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(resultAlert, animated: true, completion: nil)
    }
}

