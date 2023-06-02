//
//  ArticleListRouter.swift
//  VIPERSample
//
//  Created by 村中令 on 2023/06/02.
//

import Foundation
import UIKit

protocol ArticleListRouterProtocol: AnyObject {

    func showArticleDetail(articleEntity: ArticleEntity)
}

class ArticleListRouter: ArticleListRouterProtocol {

    weak var view: UIViewController!

    init(view: UIViewController) {
        self.view = view
    }
    
    func showArticleDetail(articleEntity: ArticleEntity) {
        print("詳細画面へ遷移する 記事ID: \(articleEntity.id)")
    }
}
