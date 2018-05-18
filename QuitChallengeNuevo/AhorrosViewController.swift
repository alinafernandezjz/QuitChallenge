//
//  AhorrosViewController.swift
//  QuitChallengeNuevo
//
//  Created by Alina Daniela Fernández on 19/03/18.
//  Copyright © 2018 Alina Daniela Fernández. All rights reserved.
//

import UIKit

class AhorrosViewController: UIViewController {

    
    @IBOutlet weak var rangoActual: UILabel!
    @IBOutlet weak var totalAhorrado: UILabel!
    @IBOutlet weak var rango3: UILabel!
    @IBOutlet weak var rango2: UILabel!
    @IBOutlet weak var rango1: UILabel!
    var usuario: String = String()
    var calcularRango: Float = Float()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarRango()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cargarRango() {
        //Esta función obtiene info del nivel del usuario y la carga a la pantalla
        calcularRango = Float(Model.returnParameter(user: usuario, type: "rango"))!
        totalAhorrado.text = String(calcularRango)
        if calcularRango < 300.0{
            rangoActual.text = "4"
            rango3.text = "Ahorrar \(300.0-calcularRango) MXN"
            rango2.text = "Ahorrar \(500.0-calcularRango) MXN"
            rango1.text = "Ahorrar \(1000.0-calcularRango) MXN"
        }else if calcularRango < 500.0{
            rangoActual.text = "3"
            rango3.text = "Alcanzado. ¡Felicidades!"
            rango2.text = "Ahorrar \(500.0-calcularRango) MXN"
            rango1.text = "Ahorrar \(1000.0-calcularRango) MXN"
        }else if calcularRango < 1000.0{
            rangoActual.text = "2"
            rango3.text = "Alcanzado. ¡Felicidades!"
            rango2.text = "Alcanzado. ¡Felicidades!"
            rango1.text = "Ahorrar \(1000.0-calcularRango) MXN"
        }else{
            rangoActual.text = "1"
            rango3.text = "Alcanzado. ¡Felicidades!"
            rango2.text = "Alcanzado. ¡Felicidades!"
            rango1.text = "Alcanzado. ¡Felicidades!"
        }
    }
    
    func cargarAhorros() {
        //Esta función carga info de la cantidad ahorrada del usuario
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
