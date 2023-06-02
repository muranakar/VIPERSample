//
//  GetArticleByIdUseCase.swift
//  VIPERSample
//
//  Created by 村中令 on 2023/06/02.
//

import Foundation

class GetArticleByIdUseCase: UseCaseProtocol {

    func execute(_ parameter: Int, completion: ((Result<ArticleEntity, Error>) -> ())?) {
        let res = ArticleEntity(id: 1, userId: 1, title: "タイトル", body: "本文")

        completion?(.success(res))
    }
}
