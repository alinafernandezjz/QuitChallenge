//
//  SaludViewController.swift
//  QuitChallengeNuevo
//
//  Created by Alina Daniela Fernández on 19/03/18.
//  Copyright © 2018 Alina Daniela Fernández. All rights reserved.
//

import UIKit

class SaludViewController: UIViewController {

    @IBOutlet weak var timer: UILabel!
    var counter = 0
    var timer2 = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)

    }
    
    func timerAction() {
        if counter < 60{
            counter += 1
        }else{
            counter = 0
            counter += 1
        }
        
        if counter < 10{
            timer.text = "00:15:0\(counter) sin cigarro"
        }else{
           timer.text = "00:15:\(counter) sin cigarro"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tiempoSinCigarro() {
        //Esta función ocupa la fecha que el usuario empezó a dejar de fumar y se la resta a la fecha actual para saber cuánto tiempo lleva sin cigarro
    }
    
    func cigarrosSinFumar() {
        //Esta función calcula la cantidad de cigarros sin fumar tomando la cantidad de cigarros que el usuario fumaba al día y multiplicandola por los días que lleva sin fumar
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
