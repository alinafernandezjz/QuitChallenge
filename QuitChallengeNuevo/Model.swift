//
//  Model.swift
//  CoreData
//
//  Created by UDLAP on 3/21/18.
//  Copyright © 2018 UDLAP. All rights reserved.
//

import UIKit
import CoreData
import Foundation

public class Model{
    
    static var managedObjectContext: NSManagedObjectContext? = nil
    static var entityDescription: NSEntityDescription? = nil
    static var fetchRequest = NSFetchRequest<NSFetchRequestResult>()
    
    static func initialize(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        entityDescription = NSEntityDescription.entity(forEntityName: "Users", in: managedObjectContext!)
    }
    
    static func selectTop1FromUsersWhere(username : String)-> Users{
        var arrayOfManagedObjects: Array<Users>
        var firstObject: Users
        fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Users")
        fetchRequest.predicate = NSPredicate(format: "username == %@", username)
        //Just one object
        fetchRequest.fetchLimit = 1
        arrayOfManagedObjects = executeFetch()
        firstObject = arrayOfManagedObjects.first!
        return firstObject
    }
    
    static func executeFetch() -> Array<Users>{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        var arrayObjectContext : Array<Users>
        arrayObjectContext = []
        do{
            arrayObjectContext = (try managedContext.fetch(Model.fetchRequest)) as! Array<Users>
            return arrayObjectContext
        }catch{
            print("Failed")
        }
        return arrayObjectContext
    }
    
    
    //We create a Managed Object (Data in Object Manager Context)
    static func insertInUsers(username:String, mail:String, password: String, numCig: String, precCig: String, fecha: String, motiv: String, frase: String, ahorro: String, logros: String){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let usuario = NSEntityDescription.insertNewObject(forEntityName: "Users", into: managedContext)
        usuario.setValue(username, forKeyPath: "username")
        usuario.setValue(mail, forKeyPath: "email")
        usuario.setValue(password, forKeyPath: "password")
        usuario.setValue(Int(numCig), forKeyPath: "numCig")
        usuario.setValue(Float(precCig), forKeyPath: "precCig")
        usuario.setValue(fecha, forKeyPath: "date")
        usuario.setValue(motiv, forKeyPath: "motivacion")
        usuario.setValue(frase, forKeyPath: "fraseMotivacional")
        usuario.setValue(Float(ahorro), forKeyPath: "ahorros")
        usuario.setValue(Int(logros), forKeyPath: "numLogros")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("No se pudo guardar, error \(error), \(error.userInfo)")
        }
        
    }
    
    static func insertInTestimonio(username:String, titulo:String, contenido: String){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let usuario = NSEntityDescription.insertNewObject(forEntityName: "Testimonios", into: managedContext)
        usuario.setValue(username, forKeyPath: "usuario")
        usuario.setValue(titulo, forKeyPath: "contenido")
        usuario.setValue(contenido, forKeyPath: "titulo")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("No se pudo guardar, error \(error), \(error.userInfo)")
        }
        
    }
    
    static func selectTestimonios(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Testimonios")
        request.returnsObjectsAsFaults = false
        do {
            let results = try managedContext.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if let username = result.value(forKey: "usuario") as? String{
                        print("Username: \(username)")
                    }
                    if let titulo = result.value(forKey: "titulo") as? String{
                        print("Título: \(titulo)")
                    }
                    if let cont = result.value(forKey: "contenido") as? String{
                        print("Contenido: \(cont)")
                    }
                }
            }
        } catch let error as NSError {
            print("No se pudo guardar, error \(error), \(error.userInfo)")
        }
    }
    
    static func selectUsers(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        do {
            let results = try managedContext.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if let username = result.value(forKey: "username") as? String{
                        print("Username: \(username)")
                    }
                    if let email = result.value(forKey: "email") as? String{
                        print("Email: \(email)")
                    }
                    if let password = result.value(forKey: "password") as? String{
                        print("Password: \(password)")
                    }
                    if let numCigarros = result.value(forKey: "numCig") {
                        print("Número de cigarros: \(numCigarros)")
                    }
                    if let precioCigarros = result.value(forKey: "precCig") {
                        print("Precio de cada cigarro: \(precioCigarros)")
                    }
                    if let fecha = result.value(forKey: "date") as? String{
                        print("Fecha para dejar de fumar: \(fecha)")
                    }
                    if let motiv = result.value(forKey: "motivacion") as? String{
                        print("Motivación para dejar de fumar: \(motiv)")
                    }
                }
            }
        } catch let error as NSError {
            print("No se pudo guardar, error \(error), \(error.userInfo)")
        }
    }
    
    static func selectTestimoniosUsuarios() -> [String] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Testimonios")
        request.returnsObjectsAsFaults = false
        var usuarios:[String] = []
        do {
            let results = try managedContext.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if let username = result.value(forKey: "usuario") as? String{
                        usuarios.append(username)
                    }
                }
            }
        } catch let error as NSError {
            print("No se pudo guardar, error \(error), \(error.userInfo)")
        }
        return usuarios
    }
    
    static func selectTestimoniosTitulos() -> [String] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Testimonios")
        request.returnsObjectsAsFaults = false
        var titulos:[String] = []
        do {
            let results = try managedContext.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if let titulo = result.value(forKey: "titulo") as? String{
                        titulos.append(titulo)
                    }
                }
            }
        } catch let error as NSError {
            print("No se pudo guardar, error \(error), \(error.userInfo)")
        }
        return titulos
    }
    
    static func selectTestimoniosContenido() -> [String] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Testimonios")
        request.returnsObjectsAsFaults = false
        var contenidos:[String] = []
        do {
            let results = try managedContext.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if let contenido = result.value(forKey: "contenido") as? String{
                        contenidos.append(contenido)
                    }
                }
            }
        } catch let error as NSError {
            print("No se pudo guardar, error \(error), \(error.userInfo)")
        }
        return contenidos
    }
    
    static func autenticate(user: String, password: String) -> Bool{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        do {
            let results = try managedContext.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if user == result.value(forKey: "username") as? String && password == result.value(forKey: "password") as? String{
                        print("Usuario y contraseña autenticada")
                        return true
                    }
                }
            }
        } catch {
            print("Usuario o contraseña incorrectos")
        }
        return false
    }
    
    static func returnParameter(user: String, type: String) -> String{ //Regresa un campo específico dado un usuario
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        var value = ""
        request.returnsObjectsAsFaults = false
        do {
            let results = try managedContext.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if user == result.value(forKey: "username") as? String{
                        if type == "pw"{
                            value = result.value(forKey: "password") as! String
                        }else if type == "cantidad"{
                            value = String(result.value(forKey: "numCig") as! Int)
                        }else if type == "costo"{
                            value = String(result.value(forKey: "precCig") as! Float)
                        }else if type == "frase"{
                            value = result.value(forKey: "fraseMotivacional") as! String
                        }else if type == "rango"{
                            value = String(result.value(forKey: "ahorros") as! Float)
                        }else if type == "logros"{
                            value = String(result.value(forKey: "numLogros") as! Int)
                        }
                    }
                }
            }
        } catch {
            print("Usuario o contraseña incorrectos")
        }
        return value
    }
    
    static func deleteUser(usernam: String){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let deletedRecord = selectTop1FromUsersWhere(username: usernam)
        managedContext.delete(deletedRecord)
        
        do {
            try managedContext.save()
            print("Registro eliminado")
        } catch let error as NSError  {
            print("No se pudo guardar: \(error), \(error.userInfo)")
        } catch {
            
        }
    }
    
    static func updateUser(usernam: String, pw: String, cant: String, costo: String, frase: String){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Users")
        let predicate = NSPredicate(format: "username = '\(usernam)'")
        fetchRequest.predicate = predicate
        do
        {
            let test = try context?.fetch(fetchRequest)
            if test?.count == 1 {
                let objectUpdate = test![0] as! NSManagedObject
                objectUpdate.setValue(pw, forKey: "password")
                objectUpdate.setValue(Int(cant), forKey: "numCig")
                objectUpdate.setValue(Float(costo), forKey: "precCig")
                objectUpdate.setValue(frase, forKey: "fraseMotivacional")
                do{
                    try context?.save()
                    print("Datos actualizados")
                }
                catch{
                    print(error)
                }
            }
        }
        catch{
            print(error)
        }
    }
    
    static func selectOneUser(usernam: String){
        let showRecord = selectTop1FromUsersWhere(username: usernam)
        if let username = showRecord.value(forKey: "username") as? String{
            print("Username: \(username)")
        }
        
    }
    
    static func save(){
        do{
            try managedObjectContext?.save()
        }catch{
            print("Failed saving")
        }
    }
    
}
