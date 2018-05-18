//
//  ComunidadViewController.swift
//  QuitChallengeNuevo
//
//  Created by Alina Daniela Fernández on 19/03/18.
//  Copyright © 2018 Alina Daniela Fernández. All rights reserved.
//

import UIKit
import CoreData

class ComunidadViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var usuario = String()
    
    @IBOutlet weak var tituloNew: UITextView!
    @IBOutlet weak var contentNew: UITextView!
    
    
    var testimonios = [""] //Almacena todos los testimonios (desde coredata) para desplegarlos en el tableView
    var content = [""]
    var users = [""]
    
    @IBAction func publish(_ sender: Any) {
        let tNew = tituloNew.text
        let cNew = contentNew.text
        Model.insertInTestimonio(username: usuario, titulo: tNew!, contenido: cNew!)
        let alert = UIAlertController(title: "Testimonio publicado", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        tituloNew.text = ""
        contentNew.text = ""
       // tableView.reloadData()
    }
    
    func getInfo(){
        users = Model.selectTestimoniosUsuarios()
        testimonios = Model.selectTestimoniosTitulos()
        content = Model.selectTestimoniosContenido()
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Va a regresar el número de testimonios
        return users.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ComunidadTableViewCell
        cell?.title.text = content[indexPath.row]
        cell?.subtitle.text = testimonios[indexPath.row]
        cell?.usuario.text = users[indexPath.row]
        
        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getInfo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    @IBAction func publicarTestimonio(_ sender: UIButton) {
        //Esta función guarda un nuevo testimonio
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
