//
//  NewsViewModel.swift
//  NewsProject
//
//  Created by Hümeyra Şahin on 18.07.2021.
//

import Foundation

struct NewsTableViewModel {
    let newsList : [News]
    
    func numberOfRowsinSection() -> Int {
        return self.newsList.count
    }
    
    func newsAtIndexPath(_ index: Int) -> NewsViewModel{
        let news = self.newsList[index]
        return NewsViewModel(news: news)
    }
}

struct NewsViewModel {
    let news: News
    var title: String{
        return self.news.title
    }
    var story: String{
        return self.news.story
    }
}
