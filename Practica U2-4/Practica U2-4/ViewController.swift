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

        let ejercicios = ["Función 1", "Función 2", "Función 3", "Clase 1", "Clase con Herencia"]

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
            funcion1()
        case 2:
            funcion2()
        case 3:
            funcion3()
        case 4:
            clase1()
        case 5:
            claseConHerencia()
        default:
            break
        }
    }

    // Funciones adicionales para los ejercicios de funciones y clases
    func funcion1() {
        let alert = UIAlertController(title: "Función 1", message: "Ingrese dos valores enteros para encontrar el menor", preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Valor 1" }
        alert.addTextField { $0.placeholder = "Valor 2" }
        alert.addAction(UIAlertAction(title: "Calcular", style: .default, handler: { _ in
            if let input1 = alert.textFields?[0].text, let val1 = Int(input1),
               let input2 = alert.textFields?[1].text, let val2 = Int(input2) {
                let menor = self.menorDeDos(val1, val2)
                self.showResult(message: "El menor de los dos valores es: \(menor)")
            } else {
                self.showResult(message: "Entrada no válida")
            }
        }))
        present(alert, animated: true, completion: nil)
    }

    func menorDeDos(_ a: Int, _ b: Int) -> Int {
        return min(a, b)
    }

    func funcion2() {
        let alert = UIAlertController(title: "Función 2", message: "Ingrese tres valores enteros para encontrar el mayor y el menor", preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Valor 1" }
        alert.addTextField { $0.placeholder = "Valor 2" }
        alert.addTextField { $0.placeholder = "Valor 3" }
        alert.addAction(UIAlertAction(title: "Calcular", style: .default, handler: { _ in
            if let input1 = alert.textFields?[0].text, let val1 = Int(input1),
               let input2 = alert.textFields?[1].text, let val2 = Int(input2),
               let input3 = alert.textFields?[2].text, let val3 = Int(input3) {
                let (mayor, menor) = self.mayorYMenor(val1, val2, val3)
                self.showResult(message: "El mayor es: \(mayor)\nEl menor es: \(menor)")
            } else {
                self.showResult(message: "Entrada no válida")
            }
        }))
        present(alert, animated: true, completion: nil)
    }

    func mayorYMenor(_ a: Int, _ b: Int, _ c: Int) -> (Int, Int) {
        let mayor = max(a, b, c)
        let menor = min(a, b, c)
        return (mayor, menor)
    }

    func funcion3() {
        let alert = UIAlertController(title: "Función 3", message: "Ingrese un número entero para imprimir su tabla de multiplicar", preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Número" }
        alert.addAction(UIAlertAction(title: "Calcular", style: .default, handler: { _ in
            if let input = alert.textFields?[0].text, let numero = Int(input) {
                let tabla = self.tablaDeMultiplicar(numero)
                self.showResult(message: tabla)
            } else {
                self.showResult(message: "Entrada no válida")
            }
        }))
        present(alert, animated: true, completion: nil)
    }

    func tablaDeMultiplicar(_ numero: Int) -> String {
        var result = ""
        for i in 1...10 {
            result += "\(numero) x \(i) = \(numero * i)\n"
        }
        return result
    }

    func clase1() {
        let alert = UIAlertController(title: "Clase 1", message: "Ingrese largo y ancho de la pared y de la ventana", preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Largo de la pared" }
        alert.addTextField { $0.placeholder = "Ancho de la pared" }
        alert.addTextField { $0.placeholder = "Largo de la ventana" }
        alert.addTextField { $0.placeholder = "Ancho de la ventana" }
        alert.addAction(UIAlertAction(title: "Calcular", style: .default, handler: { _ in
            if let inputParedLargo = alert.textFields?[0].text, let paredLargo = Double(inputParedLargo),
               let inputParedAncho = alert.textFields?[1].text, let paredAncho = Double(inputParedAncho),
               let inputVentanaLargo = alert.textFields?[2].text, let ventanaLargo = Double(inputVentanaLargo),
               let inputVentanaAncho = alert.textFields?[3].text, let ventanaAncho = Double(inputVentanaAncho) {
                let minutos = self.calcularMinutosPintura(paredLargo: paredLargo, paredAncho: paredAncho, ventanaLargo: ventanaLargo, ventanaAncho: ventanaAncho)
                self.showResult(message: "Minutos necesarios para pintar la pared: \(minutos)")
            } else {
                self.showResult(message: "Entrada no válida")
            }
        }))
        present(alert, animated: true, completion: nil)
    }

    func calcularMinutosPintura(paredLargo: Double, paredAncho: Double, ventanaLargo: Double, ventanaAncho: Double) -> Double {
        let areaPared = paredLargo * paredAncho
        let areaVentana = ventanaLargo * ventanaAncho
        let areaAPintar = areaPared - areaVentana
        return areaAPintar * 10
    }

    func claseConHerencia() {
        let alert = UIAlertController(title: "Clase con Herencia", message: "Este ejercicio requiere diseñar un programa para calcular el área de diferentes figuras geométricas", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { _ in
            let resultado = self.calcularAreaFiguras()
            self.showResult(message: resultado)
        }))
        present(alert, animated: true, completion: nil)
    }

    func calcularAreaFiguras() -> String {
        class Figura {
            func area() -> Double {
                return 0
            }
        }

        class Rectangulo: Figura {
            var largo: Double
            var ancho: Double

            init(largo: Double, ancho: Double) {
                self.largo = largo
                self.ancho = ancho
            }

            override func area() -> Double {
                return largo * ancho
            }
        }

        class Circulo: Figura {
            var radio: Double

            init(radio: Double) {
                self.radio = radio
            }

            override func area() -> Double {
                return Double.pi * radio * radio
            }
        }

        class Triangulo: Figura {
            var base: Double
            var altura: Double

            init(base: Double, altura: Double) {
                self.base = base
                self.altura = altura
            }

            override func area() -> Double {
                return (base * altura) / 2
            }
        }

        let rectangulo = Rectangulo(largo: 5, ancho: 3)
        let circulo = Circulo(radio: 4)
        let triangulo = Triangulo(base: 6, altura: 4)
        let areaRectangulo = rectangulo.area()
        let areaCirculo = circulo.area()
        let areaTriangulo = triangulo.area()

        return "Área del rectángulo: \(areaRectangulo)\nÁrea del círculo: \(areaCirculo)\nÁrea del triángulo: \(areaTriangulo)"
    }

    func showResult(message: String) {
        let resultAlert = UIAlertController(title: "Resultado", message: message, preferredStyle: .alert)
        resultAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(resultAlert, animated: true, completion: nil)
    }
}

