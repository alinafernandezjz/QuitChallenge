//
//  DatosPerfilViewController.swift
//  QuitChallengeNuevo
//
//  Created by Alina Daniela Fernández on 18/03/18.
//  Copyright © 2018 Alina Daniela Fernández. All rights reserved.
//

import UIKit
import CoreData

class DatosPerfilViewController: UIViewController {
    
    var fecha: String = String()
    var motivacion: String = String()

    //En esta clase guardamos todos los datos del nuevo usuario
    @IBOutlet weak var correo: UITextField!
    @IBOutlet weak var nombreUsuario: UITextField!
    @IBOutlet weak var contrasena: UITextField!
    @IBOutlet weak var cantCigarros: UITextField!
    @IBOutlet weak var precioCigarros: UITextField!
    

    
    @IBAction func guardarDatosUsuario(_ sender: Any) {
        Model.insertInUsers(username: nombreUsuario.text!, mail: correo.text!, password: contrasena.text!, numCig: cantCigarros.text!, precCig: precioCigarros.text!, fecha: fecha, motiv: motivacion, frase: "Quiero vivir una vida larga y saludable", ahorro: "0.0", logros: "1")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "homeId") {
            let controller = segue.destination as? ViewController
            controller?.username = nombreUsuario.text!
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
