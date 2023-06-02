//
//  ArticleListViewController.swift
//  VIPERSample
//
//  Created by 村中令 on 2023/06/01.
//

import UIKit

class ArticleListViewController: UIViewController {

    var presenter: ArticleListPresenterProtocol!

    @IBOutlet private weak var tableView: UITableView!

    private var articleEntities: [ArticleEntity] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoad()
    }
}

extension ArticleListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "記事のタイトル"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ArticleListViewController: ArticleListViewProtocol {

    func showArticles(_ articleEntities: [ArticleEntity]) {
        self.articleEntities = articleEntities
        tableView.reloadData()
    }

    func showEmpty() {
        tableView.isHidden = true
        showArticles([])
    }

    func showError(_ error: Error) {
        // 今回はスキップ
    }
}
