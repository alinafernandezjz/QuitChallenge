//
//  LogrosViewController.swift
//  QuitChallengeNuevo
//
//  Created by Alina Daniela Fernández on 19/03/18.
//  Copyright © 2018 Alina Daniela Fernández. All rights reserved.
//

import UIKit

class LogrosViewController: UIViewController {
    
    var usuario: String = String()
    var totalLogros: Int = Int()
    
    @IBOutlet weak var medal2: UIImageView!
    @IBOutlet weak var medal3: UIImageView!
    @IBOutlet weak var medal4: UIImageView!
    @IBOutlet weak var medal5: UIImageView!
    @IBOutlet weak var medal6: UIImageView!
    @IBOutlet weak var medal7: UIImageView!
    @IBOutlet weak var medal8: UIImageView!
    @IBOutlet weak var medal9: UIImageView!
    @IBOutlet weak var medal10: UIImageView!
    @IBOutlet weak var medal11: UIImageView!
    @IBOutlet weak var medal12: UIImageView!
    

    @IBAction func clickMedalla(_ sender: Any) {
        let alert = UIAlertController(title: "¡Felicidades por completar tu perfil!", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarMedallas()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cargarMedallas() {
        //Esta función carga la información de las medallas que se han obtenido
        totalLogros = Int(Model.returnParameter(user: usuario, type: "logros"))!
        if totalLogros > 1{
            medal2.image = UIImage(named: "medalla.png")
        }
        if totalLogros > 2{
            medal3.image = UIImage(named: "medalla.png")
        }
        if totalLogros > 3{
            medal4.image = UIImage(named: "medalla.png")
        }
        if totalLogros > 4{
            medal5.image = UIImage(named: "medalla.png")
        }
        if totalLogros > 5{
            medal6.image = UIImage(named: "medalla.png")
        }
        if totalLogros > 6{
            medal7.image = UIImage(named: "medalla.png")
        }
        if totalLogros > 7{
            medal8.image = UIImage(named: "medalla.png")
        }
        if totalLogros > 8{
            medal9.image = UIImage(named: "medalla.png")
        }
        if totalLogros > 9{
            medal10.image = UIImage(named: "medalla.png")
        }
        if totalLogros > 10{
            medal11.image = UIImage(named: "medalla.png")
        }
        if totalLogros > 11{
            medal12.image = UIImage(named: "medalla.png")
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
