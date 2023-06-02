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
        guard let articleDetailViewController = UIStoryboard(name: "ArticleDetail", bundle: nil).instantiateInitialViewController() as? ArticleDetailViewController else {
                   fatalError()
               }

               articleDetailViewController.articleEntity = articleEntity

               articleDetailViewController.presenter = ArticleDetailPresenter(
                   view: articleDetailViewController,
                   inject: ArticleDetailPresenter.Dependency(
                       getArticleByIdUseCase: UseCase(GetArticleByIdUseCase())
                   )
               )

               view.navigationController?.pushViewController(articleDetailViewController,
                                                             animated: true)
    }
}
