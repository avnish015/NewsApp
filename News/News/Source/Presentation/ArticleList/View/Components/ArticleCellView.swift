//
//  ArticleCellView.swift
//  News
//
//  Created by Avnish Kumar on 02/01/24.
//

import SwiftUI
import Kingfisher

struct ArticleCellView: View {

    let viewModel: ArticleCellViewModelProtocol

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                Text(viewModel.author)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                Text(viewModel.title)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.system(size: 12))
                Text(viewModel.publishedAt)
                    .font(.system(size: 12))
            }
            Spacer()
            KFImage.url(viewModel.urlToImage)
                .cancelOnDisappear(true)
                .placeholder({
                    Image.placeholder
                        .resizable()
                })
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(8)
        }
    }
}

#if DEBUG
struct ArticleCellView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCellView(viewModel: ArticleCellViewModel(article: Article.sampleArticle))
    }
}
#endif
