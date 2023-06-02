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

    weak var view: ArticleListViewProtocol!

    init(view: ArticleListViewProtocol) {
        self.view = view
    }
}

// extentionで実装したほうが、可読性が上がる。
extension ArticleListPresenter: ArticleListPresenterProtocol {

    func didLoad() {

    }

    func didSelect(articleEntity: ArticleEntity) {

    }
}
