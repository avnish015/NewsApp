//
//  ArticleListView.swift
//  News
//
//  Created by Avnish Kumar on 02/01/24.
//

import SwiftUI

struct ArticleListView<ViewModel>: View where ViewModel: ArticleListViewModelProtocol {

    typealias Copy = DisplayStrings.ArticleList
    
    @EnvironmentObject private var navigationManager: NavigationManager
    @ObservedObject var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading) {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .loaded:
                articleListView()
            case .failed(let description):
               failedErrorView(description: description)
            }
        }
        .onAppear {
            if viewModel.isEmpty {
                viewModel.refreshArticleList(showLoading: true)
            }
        }
        .navigationTitle(Copy.title)
    }

    private func articleListView() -> some View {
        List {
            ForEach(viewModel.articleList) { article in
                ArticleCellView(viewModel: viewModel.createArticleCellViewModel(for: article))
                    .contentShape(Rectangle())
                    .accessibilityElement(children: .ignore)
                    .accessibilityHint(article.accessabilityHint)
                    .accessibilityIdentifier(Copy.ArticleCell.accessabilityIdentifier(title: article.title))
                    .accessibilityAddTraits(.isButton)
                    .onTapGesture {
                        navigationManager.push(.articleDetails(article))
                    }
            }
        }
        .refreshable {
            viewModel.refreshArticleList(showLoading: false)
        }
        .accessibilityIdentifier(Copy.identifier)
        .listStyle(.plain)
        .listRowSeparator(.visible, edges: .all)
        .padding(.all, 0)
    }

    private func failedErrorView(description: String) -> some View {
        VStack {
            if #available(iOS 17.0, *) {
                ContentUnavailableView {
                    Image.unavailable.foregroundColor(.yellow)
                } description: {
                    Text(description)
                } actions: {
                    Button(Copy.retry) {
                        viewModel.refreshArticleList(showLoading: true)
                    }
                }
                .accessibilityIdentifier(Copy.errorViewIdentifier)
            } else {
                ErrorView(description: Copy.retry, buttonTitle: DisplayStrings.ArticleList.retry) {
                    viewModel.refreshArticleList(showLoading: true)
                }
            }
        }
    }
}


#if DEBUG
#Preview {
    NavigationView {
        let viewModel = try! AppDIContainer.shared.resolve(type: ArticleListViewModel.self)
        ArticleListView(viewModel: viewModel)
    }
}
#endif
