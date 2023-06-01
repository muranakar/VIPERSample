//
//  SceneDelegate.swift
//  VIPERSample
//
//  Created by 村中令 on 2023/05/27.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }

        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()

        guard let articleListViewController = UIStoryboard(name: "ArticleList", bundle: nil).instantiateInitialViewController() as? ArticleListViewController else {
            fatalError()
        }

        let navigation = UINavigationController(rootViewController: articleListViewController)
        window?.rootViewController = navigation
    }
}

