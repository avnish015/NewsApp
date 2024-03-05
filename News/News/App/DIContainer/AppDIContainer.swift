//
//  AppDIContainer.swift
//  News
//
//  Created by Avnish Kumar on 13/02/24.
//

import Foundation
import Kingfisher

final class AppDIContainer: ObservableObject {
    
    let imageAuthenticationHandler = ImageAuthenticationHandler()

    init() {
        KingfisherManager.shared.downloader.authenticationChallengeResponder = imageAuthenticationHandler
    }
    
    // MARK: - Use Cases
    func makeArticleListUseCase() -> ArticleListUseCaseProtocol {
        let repository = makeArticleListRepository()
        return ArticleListUseCase(repository: repository)
    }
    
    // MARK: - Repositories
    func makeArticleListRepository() -> ArticleListRepositoryProtocol {
        let service = makeArticleListService()
        return ArticleListRepository(service: service)
    }
    
    // MARK: - Service
    func makeArticleListService() -> ArticleListServiceProtocol {
        let authenticator = URLSessionTrustEvaluator()
        let urlSession = URLSession(configuration: .default, delegate: authenticator, delegateQueue: nil)
        let apiClient = URLSessionApiClient(session: urlSession)
        return ArticleListService(apiClient: apiClient)
    }
    
    // MARK: - Article List
    func makeArticleListViewModel() -> ArticleListViewModel {
        let useCase = makeArticleListUseCase()
        return ArticleListViewModel(useCase: useCase)
    }
    
    func makeArticleListView() -> ArticleListView<ArticleListViewModel>  {
        let viewModel = makeArticleListViewModel()
        return ArticleListView(viewModel: viewModel)

    }
    
    //MARK: - Article Details
    func makeArticleDetailsViewModel(with article: Article) -> ArticleDetailsViewModelProtocol {
        return  ArticleDetailsViewModel(article: article)
    }
    
    func makeArticleDetailsView(article: Article) -> ArticleDetailsView {
        let viewModel = makeArticleDetailsViewModel(with: article)
        return ArticleDetailsView(viewModel: viewModel)
    }
}

#if DEBUG
extension AppDIContainer {
    static var preview: Self {
        .init()
    }
}
#endif
