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
 
        let ejercicios = ["Ejercicio 1", "Ejercicio 2", "Ejercicio 3", "Ejercicio 4", "Ejercicio 5", "Ejercicio 6", "Ejercicio 7"]
 
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

         default:

             break

         }

     }
 
    func ejercicio1() {

         let alert = UIAlertController(title: "Ejercicio 1", message: "Ingrese el valor de a y b para verificar si a es divisible entre b", preferredStyle: .alert)

         alert.addTextField { $0.placeholder = "Valor de a" }

         alert.addTextField { $0.placeholder = "Valor de b" }

         alert.addAction(UIAlertAction(title: "Calcular", style: .default, handler: { _ in

             if let inputA = alert.textFields?[0].text, let a = Int(inputA),

                let inputB = alert.textFields?[1].text, let b = Int(inputB), b != 0 {

                 let result = (a % b == 0) ? "\(a) es divisible entre \(b)" : "\(a) no es divisible entre \(b)"

                 self.showResult(message: result)

             } else {

                 self.showResult(message: "Entrada no válida o división entre cero")

             }

         }))

         present(alert, animated: true, completion: nil)

     }
 
    func ejercicio2() {

         let alert = UIAlertController(title: "Ejercicio 2", message: "Ingrese los días de los blanquillos y el tocino en el refrigerador", preferredStyle: .alert)

         alert.addTextField { $0.placeholder = "Días de blanquillos" }

         alert.addTextField { $0.placeholder = "Días de tocino" }

         alert.addAction(UIAlertAction(title: "Verificar", style: .default, handler: { _ in

             if let inputEggs = alert.textFields?[0].text, let eggsDays = Int(inputEggs),

                let inputBacon = alert.textFields?[1].text, let baconDays = Int(inputBacon) {

                 let eggsOk = eggsDays <= 21

                 let baconOk = baconDays <= 7

                 let result: String

                 if eggsOk && baconOk {

                     result = "Ambos ingredientes se pueden cocinar"

                 } else if !eggsOk && !baconOk {

                     result = "Ambos ingredientes deben desecharse"

                 } else if !eggsOk {

                     result = "Los blanquillos deben desecharse"

                 } else {

                     result = "El tocino debe desecharse"

                 }

                 self.showResult(message: result)

             } else {

                 self.showResult(message: "Entrada no válida")

             }

         }))

         present(alert, animated: true, completion: nil)

     }
 
    func ejercicio3() {

         let alert = UIAlertController(title: "Ejercicio 3", message: "Ingrese los valores de x e y", preferredStyle: .alert)

         alert.addTextField { $0.placeholder = "Valor de x" }

         alert.addTextField { $0.placeholder = "Valor de y" }

         alert.addAction(UIAlertAction(title: "Calcular", style: .default, handler: { _ in

             if let inputX = alert.textFields?[0].text, let x = Int(inputX),

                let inputY = alert.textFields?[1].text, let y = Int(inputY) {

                 let result: String

                 if x == y {

                     result = "x es igual a y. Resultado: \(x * y)"

                 } else if x > y {

                     result = "x es mayor que y. Resultado: \(x - y)"

                 } else {

                     result = "x es menor que y. Resultado: \(x + y)"

                 }

                 self.showResult(message: result)

             } else {

                 self.showResult(message: "Entrada no válida")

             }

         }))

         present(alert, animated: true, completion: nil)

     }
 
    func ejercicio4() {

         let alert = UIAlertController(title: "Ejercicio 4", message: "Ingrese el año para verificar si es bisiesto", preferredStyle: .alert)

         alert.addTextField { $0.placeholder = "Año" }

         alert.addAction(UIAlertAction(title: "Verificar", style: .default, handler: { _ in

             if let inputYear = alert.textFields?[0].text, let year = Int(inputYear) {

                 let result = (year % 4 == 0) ? "\(year) es un año bisiesto" : "\(year) no es un año bisiesto"

                 self.showResult(message: result)

             } else {

                 self.showResult(message: "Entrada no válida")

             }

         }))

         present(alert, animated: true, completion: nil)

     }
 
    func ejercicio5() {

         let alert = UIAlertController(title: "Ejercicio 5", message: "Ingrese los valores de a, b y c", preferredStyle: .alert)

         alert.addTextField { $0.placeholder = "Valor de a" }

         alert.addTextField { $0.placeholder = "Valor de b" }

         alert.addTextField { $0.placeholder = "Valor de c" }

         alert.addAction(UIAlertAction(title: "Verificar", style: .default, handler: { _ in

             if let inputA = alert.textFields?[0].text, let a = Int(inputA),

                let inputB = alert.textFields?[1].text, let b = Int(inputB),

                let inputC = alert.textFields?[2].text, let c = Int(inputC) {

                 let result = (a == b || a == c || b == c) ? "Al menos dos variables son iguales" : "Todas las variables son diferentes"

                 self.showResult(message: result)

             } else {

                 self.showResult(message: "Entrada no válida")

             }

         }))

         present(alert, animated: true, completion: nil)

     }
 
    func ejercicio6() {

         let alert = UIAlertController(title: "Ejercicio 6", message: "Ingrese la duración de la llamada en minutos", preferredStyle: .alert)

         alert.addTextField { $0.placeholder = "Duración en minutos" }

         alert.addAction(UIAlertAction(title: "Calcular", style: .default, handler: { _ in

             if let inputMinutes = alert.textFields?[0].text, let minutes = Int(inputMinutes) {

                 let cost = (minutes <= 3) ? 5 : 5 + (minutes - 3) * 3

                 self.showResult(message: "El costo de la llamada es: $\(cost)")

             } else {

                 self.showResult(message: "Entrada no válida")

             }

         }))

         present(alert, animated: true, completion: nil)

     }
 
    func ejercicio7() {

         let alert = UIAlertController(title: "Ejercicio 7", message: "Ingrese 5 números enteros separados por espacios", preferredStyle: .alert)

         alert.addTextField { $0.placeholder = "Números separados por espacios" }

         alert.addAction(UIAlertAction(title: "Calcular", style: .default, handler: { _ in

             if let inputNumbers = alert.textFields?[0].text {

                 let numbers = inputNumbers.split(separator: " ").compactMap { Int($0) }

                 if numbers.count == 5 {

                     let sortedNumbers = numbers.sorted()

                     let remainingNumbers = sortedNumbers[1...3]

                     let sum = remainingNumbers.reduce(0, +)

                     let average = Double(sum) / Double(remainingNumbers.count)

                     let result = "El mayor es: \(sortedNumbers.last!)\nEl menor es: \(sortedNumbers.first!)\nLos 3 números restantes son: \(remainingNumbers.map { String($0) }.joined(separator: ", "))\nEl promedio de los 3 números restantes es: \(average)"

                     self.showResult(message: result)

                 } else {

                     self.showResult(message: "Por favor ingrese exactamente 5 números")

                 }

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
