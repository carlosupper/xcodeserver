//
//  AppDelegate.swift
//  NotificacionesAgrupadas
//
//  Created by chernandezh on 02/03/22.
//

import UIKit
import UserNotifications
@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }
        
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("didReceive notification \(response.notification.request.identifier) \(response.notification.request.content.threadIdentifier)")
       var pendingGroup: [String] = []
        center.getDeliveredNotifications{
            respuesta in respuesta.forEach {
                actualRespuesta in
                if actualRespuesta.request.content.threadIdentifier == response.notification.request.content.threadIdentifier {
                    pendingGroup.append(actualRespuesta.request.identifier)
                }
                //center.removeDeliveredNotifications(withIdentifiers: pendingGroup)
            }
        }
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        var pendingGroup: [String] = []
        center.getDeliveredNotifications{
            respuesta in respuesta.forEach {
                actualRespuesta in
                if actualRespuesta.request.content.threadIdentifier == notification.request.content.threadIdentifier {
                    pendingGroup.append(actualRespuesta.request.identifier)
                }
                center.removeDeliveredNotifications(withIdentifiers: pendingGroup)

            }
            
        }
        print("Will present notification \(notification.request.identifier) \(notification.request.content.threadIdentifier)")
          /*  var pendingGroup: [String] = []
                    center.getPendingNotificationRequests { allrequest in
                        allrequest.forEach { currentRequest in
                            if currentRequest.content.threadIdentifier == notification.request.content.threadIdentifier {
                                pendingGroup.append(currentRequest.identifier)
                            }
                        }
                        print("id's de los pending group\(pendingGroup)")
                        center.removePendingNotificationRequests(withIdentifiers: pendingGroup)
                    }*/

                //completionHandler([])
        completionHandler([.alert, .sound])

    }

}

