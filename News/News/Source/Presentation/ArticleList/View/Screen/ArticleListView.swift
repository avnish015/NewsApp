//
//  ArticleListView.swift
//  News
//
//  Created by Avnish Kumar on 02/01/24.
//

import SwiftUI

struct ArticleListView<ViewModel>: View where ViewModel: ArticleListViewModelProtocol {

    typealias Copy = DisplayStrings.ArticleList

    @EnvironmentObject var appDIContainer: AppDIContainer
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
    }

    private func articleListView() -> some View {
        List {
            ForEach(viewModel.articleList) { article in
                NavigationLink {
                    appDIContainer.makeArticleDetailsView(article: article)
                } label: {
                    ArticleCellView(viewModel: viewModel.createArticleCellViewModel(for: article))
                        .accessibilityElement(children: .ignore)
                        .accessibilityHint(article.accessabilityHint)
                        .accessibilityIdentifier(Copy.ArticleCell.accessabilityIdentifier(title: article.title))
                }
            }
        }
        .refreshable {
            viewModel.refreshArticleList(showLoading: false)
        }
        .accessibilityIdentifier(Copy.identifier)
        .listStyle(.plain)
        .listRowSeparator(.visible, edges: .all)
        .navigationTitle(Copy.title)
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
                NetworkErrorView(description: description) {
                    viewModel.refreshArticleList(showLoading: true)
                }
                .accessibilityIdentifier(Copy.errorViewIdentifier)
            }
        }
    }
}

#if DEBUG
struct ArticleListView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView {
            ArticleListView(viewModel: AppDIContainer.preview.makeArticleListViewModel()).environmentObject(AppDIContainer.preview)
        }
    }
}
#endif
