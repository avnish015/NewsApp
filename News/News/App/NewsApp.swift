//
//  NewsApp.swift
//  News
//
//  Created by Avnish Kumar on 02/01/24.
//

import SwiftUI

@main
struct NewsApp: App {
    
    // MARK: - Property
    private let appDIContainer = AppDIContainer.shared
    private let appConfiguration = AppConfiguration()

    // MARK: - Initilize
    init() {
        do {
            try registerDependenceis()
        } catch {
            assertionFailure(error.localizedDescription)
        }
    }

    var body: some Scene {
        return WindowGroup {
            AppNavigationView()
        }
    }
    
    // MARK: - Register Dependenceis
    private func registerDependenceis()throws {
        
        // MARK: - Register URLSession Api Client
        appDIContainer.register(type: ApiClient.self, dependency: URLSessionApiClient(session: appConfiguration.urlSession()))

      // MARK: - Register Article List Service
        appDIContainer.register(type: ArticleListServiceProtocol.self, dependency: ArticleListService(apiClient:  try appDIContainer.resolve(type: ApiClient.self)))
      
      // MARK: - Register Article List Repository
        appDIContainer.register(type: ArticleListRepositoryProtocol.self, dependency: ArticleListRepository(service: try appDIContainer.resolve(type: ArticleListServiceProtocol.self)))
      
      // MARK: - Register Article List UseCase
        appDIContainer.register(type: ArticleListUseCaseProtocol.self, dependency: ArticleListUseCase(repository: try appDIContainer.resolve(type: ArticleListRepositoryProtocol.self)))

        // MARK: - Register Article List ViewModel
        appDIContainer.register(type: ArticleListViewModel.self, dependency: ArticleListViewModel(useCase: try appDIContainer.resolve(type: ArticleListUseCaseProtocol.self)))

      // MARK: - Register Article Details ViewModel
        appDIContainer.register(type: ArticleDetailsViewModel.self) { article in
            ArticleDetailsViewModel(article: article)
      }
    }
}
