//
//  ArticleListPresenter.swift
//  VIPERSample
//
//  Created by 村中令 on 2023/06/02.
//

import Foundation

//　Viewdidloadされたときであったり、セルがタップされた時のプロトコル。
protocol ArticleListPresenterProtocol: AnyObject {
    func didLoad()
    func didSelect(articleEntity: ArticleEntity)
}

// 記事を表示したい時、エラーが返って来たときに、エラー表示をしたりする。
protocol ArticleListViewProtocol: AnyObject {
    func showArticles(_ articleEntities: [ArticleEntity])
    func showEmpty()
    func showError(_ error: Error)
}

class ArticleListPresenter {
    struct Dependency {
        let router: ArticleListRouterProtocol!
        let getArticlesArrayUseCase: UseCase<Void, [ArticleEntity], Error>
    }

    weak var view: ArticleListViewProtocol!
    private var di: Dependency

    init(view: ArticleListViewProtocol, inject dependency: Dependency) {
        self.view = view
        self.di = dependency
    }
}

// extentionで実装したほうが、可読性が上がる。
extension ArticleListPresenter: ArticleListPresenterProtocol {

    func didLoad() {
        GetArticlesArrayUseCase().execute(()) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let articleEntities):
                if articleEntities.isEmpty {
                    self.view.showEmpty()
                    return
                }
                self.view.showArticles(articleEntities)
            case .failure(let error):
                self.view.showError(error)
            }
        }

    }

    func didSelect(articleEntity: ArticleEntity) {

    }
}
