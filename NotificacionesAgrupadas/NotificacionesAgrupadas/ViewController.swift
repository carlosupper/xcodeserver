//
//  ViewController.swift
//  NotificacionesAgrupadas
//
//  Created by chernandezh on 02/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        permisosNotificacion()

    }

    func permisosNotificacion()
    {
            let centro = UNUserNotificationCenter.current()
            centro.requestAuthorization(options: [.sound, .alert, .badge])
            { permisoOtorgado , _ in
                DispatchQueue.main.async {
                    if permisoOtorgado
                    {
                        UIApplication.shared.registerForRemoteNotifications()
                    }
                    else
                    {
                        
                    }
                   
                }
                
            }
    }
    
    func programarNotificacionesAgrupadas()
    {
        for i in 1...3 {
            

            let contenidoNotificacion = UNMutableNotificationContent()
            contenidoNotificacion.title = "Grupo2"
            contenidoNotificacion.body = "Mensaje\(i)"
            contenidoNotificacion.sound = UNNotificationSound.default
            contenidoNotificacion.threadIdentifier = "GRUPO2"
           
                let disparador = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                let respuesta = UNNotificationRequest(identifier: "Mens\(i)", content: contenidoNotificacion, trigger: disparador)
            //print("notificacion con dentificador: \(respuesta.identifier) Grupo2")
            let centro = UNUserNotificationCenter.current()
            /*var pendingGroup: [String] = []
                    centro.getPendingNotificationRequests { allrequest in
                        allrequest.forEach { currentRequest in
                            if currentRequest.content.threadIdentifier == respuesta.content.threadIdentifier {
                                pendingGroup.append(currentRequest.identifier)
                            }

                        }
                        //print("id's de los pending group\(pendingGroup)")
                        centro.removePendingNotificationRequests(withIdentifiers: pendingGroup)
                    }*/
               centro.add(respuesta) { (error: Error?) in
                    if let elError = error {
                        print(elError)
                    }

                }
            

            
       }
    }
    
    
    func programarNotificacionesAgrupadasPersonalizadas ()
    {
        for i in 1...3 {
            

            let contenidoNotificacion = UNMutableNotificationContent()
            contenidoNotificacion.title = "Grupo1"
            contenidoNotificacion.body = "Mensaje\(i)"
            contenidoNotificacion.sound = UNNotificationSound.default
            contenidoNotificacion.threadIdentifier = "GRUPO1"
           
                let disparador = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                let respuesta = UNNotificationRequest(identifier: "Mensaje\(i)", content: contenidoNotificacion, trigger: disparador)
                //print("notificacion con dentificador: \(respuesta.identifier) Grupo1")
            let centro = UNUserNotificationCenter.current()
            /*var pendingGroup: [String] = []
                    centro.getPendingNotificationRequests { allrequest in
                        allrequest.forEach { currentRequest in
                            if currentRequest.content.threadIdentifier == respuesta.content.threadIdentifier {
                                pendingGroup.append(currentRequest.identifier)
                            }

                        }
                        //print("id's de los pending group\(pendingGroup)")
                        centro.removePendingNotificationRequests(withIdentifiers: pendingGroup)
                    }*/
               centro.add(respuesta) { (error: Error?) in
                    if let elError = error {
                        print(elError)
                    }

                }
            

            
       }
    }


    
    
    @IBAction func createNotificationsButton(_ sender: UIButton) {
        programarNotificacionesAgrupadas()
    }
    
    
    @IBAction func customNotificationsButton(_ sender: Any) {
        programarNotificacionesAgrupadasPersonalizadas()
    }
    
}

