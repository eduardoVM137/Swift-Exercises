import UIKit
 
class ViewController: UIViewController {
 
    // UI Elements

     let inputTextView = UITextView()

     let resultTextView = UITextView()

     let ejercicio1Button = UIButton()

     let ejercicio2Button = UIButton()

     let ejercicio3Button = UIButton()

     let ejercicio4Button = UIButton()

     let ejercicio5Button = UIButton()

     let ejercicio6Button = UIButton()
 
    override func viewDidLoad() {

         super.viewDidLoad()

         // Do any additional setup after loading the view.
 
        setupUI()

     }
 
    func setupUI() {

         // Setting up Input TextView

         inputTextView.frame = CGRect(x: 20, y: 80, width: view.frame.width - 40, height: 100)

         inputTextView.layer.borderWidth = 1

         inputTextView.layer.borderColor = UIColor.gray.cgColor

         view.addSubview(inputTextView)
 
        // Setting up Result TextView

         resultTextView.frame = CGRect(x: 20, y: 200, width: view.frame.width - 40, height: 150)

         resultTextView.layer.borderWidth = 1

         resultTextView.layer.borderColor = UIColor.gray.cgColor

         resultTextView.isEditable = false

         view.addSubview(resultTextView)
 
        // Setting up Buttons

         let buttonTitles = ["Ejercicio 1", "Ejercicio 2", "Ejercicio 3", "Ejercicio 4", "Ejercicio 5", "Ejercicio 6"]

         let buttons = [ejercicio1Button, ejercicio2Button, ejercicio3Button, ejercicio4Button, ejercicio5Button, ejercicio6Button]
 
        for (index, button) in buttons.enumerated() {

             button.frame = CGRect(x: 20, y: 370 + index * 50, width: Int(view.frame.width - 40), height: 40)

             button.setTitle(buttonTitles[index], for: .normal)

             button.backgroundColor = .systemBlue

             button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)

             view.addSubview(button)

         }

     }
 
    @objc func buttonTapped(_ sender: UIButton) {

         guard let buttonTitle = sender.currentTitle else { return }
 
        switch buttonTitle {

         case "Ejercicio 1":

             ejercicio1()

         case "Ejercicio 2":

             ejercicio2()

         case "Ejercicio 3":

             if let x = Int(inputTextView.text) {

                 ejercicio3(x: x)

             } else {

                 resultTextView.text = "Por favor ingrese un valor entero para X."

             }

         case "Ejercicio 4":

             let values = inputTextView.text.split(separator: ",").compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }

             if values.count == 2 {

                 ejercicio4(a: values[0], b: values[1])

             } else {

                 resultTextView.text = "Por favor ingrese dos valores enteros para A y B separados por una coma."

             }

         case "Ejercicio 5":

             let values = inputTextView.text.split(separator: ",").compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }

             if values.count == 4 {

                 ejercicio5(ancho: values[0], alto: values[1], x: values[2], y: values[3])

             } else {

                 resultTextView.text = "Por favor ingrese cuatro valores enteros para ancho, alto, x, y separados por comas."

             }

         case "Ejercicio 6":

             let values = inputTextView.text.split(separator: ",").compactMap { Double($0.trimmingCharacters(in: .whitespaces)) }

             if values.count == 2 {

                 ejercicio6(r: values[0], h: values[1])

             } else {

                 resultTextView.text = "Por favor ingrese dos valores para radio y altura separados por una coma."

             }

         default:

             break

         }

     }
 
    // Ejercicio 1: Edad de Sparky

     func ejercicio1() {

         let edadSparkyPerro = 42

         let edadSparkyHumano = edadSparkyPerro / 7

         resultTextView.text = "La edad de Sparky en años humanos es: \(edadSparkyHumano)"

     }
 
    // Ejercicio 2: Intercambio de Manzanas y Naranjas

     func ejercicio2() {

         let manzanasIniciales = 10

         let naranjasPorManzanas = 3.0 / 5.0

         let naranjasObtenidas = Int(Double(manzanasIniciales) * naranjasPorManzanas)

         let manzanasRestantes = manzanasIniciales % 5

         resultTextView.text = "Naranjas obtenidas: \(naranjasObtenidas), Manzanas restantes: \(manzanasRestantes)"

     }
 
    // Ejercicio 3: Cálculo de Y en base a una fórmula

     func ejercicio3(x: Int) {

         // Ejemplo de cálculo (Definir la fórmula completa según archivo original)

         let y = x * x - 2 * x + 1

         resultTextView.text = "El valor calculado de Y es: \(y)"

     }
 
    // Ejercicio 4: Operación con A y B

     func ejercicio4(a: Int, b: Int) {

         let resultado = a * b + b * b - a

         resultTextView.text = "El resultado es: \(resultado)"

     }
 
    // Ejercicio 5: Cálculo del Perímetro y Área de la Figura en L

     func ejercicio5(ancho: Int, alto: Int, x: Int, y: Int) {

         let area = (ancho * alto) - (x * y)

         let perimetro = 2 * (ancho + alto - y)

         resultTextView.text = "Área: \(area), Perímetro: \(perimetro)"

     }
 
    // Ejercicio 6: Volumen del Cilindro

     func ejercicio6(r: Double, h: Double) {

         let volumen = Double.pi * pow(r, 2) * h

         let volumenRedondeado = String(format: "%.2f", volumen)

         resultTextView.text = "El volumen del cilindro es: \(volumenRedondeado)"

     }

 }
