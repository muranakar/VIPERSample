//
//  ArticleDetail.swift
//  VIPERSample
//
//  Created by 村中令 on 2023/06/03.
//

import Foundation


protocol ArticleDetailPresenterProtocol: AnyObject {

    func didLoad(articleEntity: ArticleEntity)
}

protocol ArticleDetailViewProtocol: AnyObject {

    func showArticle(_ articleEntity: ArticleEntity)
    func showError(_ error: Error)
}

class ArticleDetailPresenter {

    struct Dependency {
        let getArticleByIdUseCase: UseCase<Int, ArticleEntity, Error>
    }

    weak var view: ArticleDetailViewProtocol!
    private var di: Dependency

    init(view: ArticleDetailViewProtocol, inject dependency: Dependency) {
        self.view = view
        self.di = dependency
    }
}

extension ArticleDetailPresenter: ArticleDetailPresenterProtocol {

    func didLoad(articleEntity: ArticleEntity) {
        di.getArticleByIdUseCase.execute(articleEntity.id) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let articleEntity):
                self.view.showArticle(articleEntity)
            case .failure(let error):
                self.view.showError(error)
            }
        }
    }
}
