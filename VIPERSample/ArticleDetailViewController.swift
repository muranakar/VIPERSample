//
//  ArticleDetailViewController.swift
//  VIPERSample
//
//  Created by 村中令 on 2023/06/01.
//

import UIKit

class ArticleDetailViewController: UIViewController {

    enum Row: String {
        case title
        case body

        static var rows: [Row] {
            return [.title, .body]
        }
    }
    var articleEntity: ArticleEntity!
    var presenter: ArticleDetailPresenterProtocol!

    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoad(articleEntity: articleEntity)
    }
}

extension ArticleDetailViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Row.rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Row.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.rawValue, for: indexPath)

        if row == .title {
            cell.textLabel?.text = "タイトル"
            cell.detailTextLabel?.text = "記事のタイトル"
        }
        if row == .body {
            cell.textLabel?.text = "記事の本文"
            cell.detailTextLabel?.text = nil
        }
        return cell
    }
}

extension ArticleDetailViewController: ArticleDetailViewProtocol {

    func showArticle(_ articleEntity: ArticleEntity) {
        self.articleEntity = articleEntity
        tableView.reloadData()
    }

    func showError(_ error: Error) {
        // 今回はスキップ
    }
}
