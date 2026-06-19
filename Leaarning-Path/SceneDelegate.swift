//
//  SceneDelegate.swift
//  Leaarning-Path
//
//  Created by Jose Pernia on 18-06-26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let window = UIWindow(windowScene: windowScene)

        let homeViewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: homeViewController)

        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        self.window = window
    }
}
