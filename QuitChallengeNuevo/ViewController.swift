//
//  ViewController.swift
//  QuitChallengeNuevo
//
//  Created by Alina Daniela Fernández on 01/10/17.
//  Copyright © 2017 Alina Daniela Fernández. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let consejos = ["Consejo: Comunica tu decisión de dejar de fumar a familiares y amigos, ellos te pueden ayudar en el proceso.",
                    "Consejo: Deshazte de los cigarrillos y de los ceniceros, y limpia todo lo que tenga olor a humo: ropa, muebles, cortinas, etc.",
                    "Consejo: ¿Anioso por fumar? Mastica un chicle sin azúcar, te ayudará a saciar la necesidad",
                    "Consejo: Cambiar tus rutinas puede ayudarte a dejar de fumar. Come a horas diferentes o realiza muchas comidas pequeñas en lugar de tres comidas grandes.",
                    "Consejo: Infórmate sobre los productos para el reemplazo de la nicotina (chicles, parches, etc.) que te pueden ayudar a dejar de fumar.",
                    "Consejo: ¿Ganas de fumar? Haz más ejercicio. Camina o anda en bicicleta. El ejercicio te ayudará a aliviar las ganas de fumar.",
                    "Consejo: Beber mucha agua y mantenerte hidratado te ayudará a dejar de fumar, evita el alcohol.",
                    "Consejo: Anota en una lista todas las razones por las que decidiste dejar de fumar, piensa positivamente y enfócate",
                    "Consejo: Evita comidas que engorden y si necesitas picar algo, las verduras son tus mejores aliadas"] //Guarda consejos para dejar de fumar
    var username: String = String()

    @IBOutlet weak var frase: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.setHidesBackButton(true, animated:true) //Para que el usuario no pueda regresar a la pantalla de iniciar sesión una vez que ya entró

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated:true)
        DispatchQueue.main.async {
            self.frase.text = Model.returnParameter(user: self.username, type: "frase")
        }
    }
    
    @IBAction func tips(_ sender: UIButton) {
        //Esta función despliega varios tips aleatorios que ayudan al usuario a dejar de fumar
        let randomNum = Int(arc4random_uniform(8))
        let alert = UIAlertController(title: consejos[randomNum], message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "conf") {
            let controller = segue.destination as? ConfigurationViewController
            controller?.user = username
        }
        if(segue.identifier == "ahorros"){
            let controller = segue.destination as? AhorrosViewController
            controller?.usuario = username
        }
        if(segue.identifier == "logros"){
            let controller = segue.destination as? LogrosViewController
            controller?.usuario = username
        }
        if(segue.identifier == "com"){
            let controller = segue.destination as? ComunidadViewController
            controller?.usuario = username
        }
    }
    
}

//extension UIViewController{ //necesitamos que la acción pueda ser accedida en ambos view controllers
//    func swipeAction(swipe:UISwipeGestureRecognizer){
//        switch swipe.direction.rawValue {
//        case 1:
//            performSegue(withIdentifier: "swipeLeft", sender: self)
//        case 2:
//            performSegue(withIdentifier: "swipeRight", sender: self)
//        default:
//            break
//        }
//        
//    }
//    
//}

