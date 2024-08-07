//
//  MovieViewModel.swift
//  Movs-Test
//
//  Created by Jose David Bustos H on 06-08-24.
//  Copyright © 2024 Jose David Bustos H. All rights reserved.

import Foundation
import Combine

class MovieViewModel: ObservableObject {
    @Published var indicadores: [Movie] = []
    private let networkService = NetworkService()
    var reloadList: (() -> Void)?
    var arrayOfList: [Movie] = [] {
        didSet {
            reloadList?()
        }
    }
    
    init() {
        fetchIndicadores()
    }
    
    func fetchIndicadores() {
        networkService.fetchIndicadores { [weak self] response in
            guard let self = self, let response = response else { return }
            DispatchQueue.main.async {
                self.indicadores = response
                self.arrayOfList = response
            }
        }
    }
    
    func searchMovies(with query: String) {
        if query.isEmpty {
            indicadores = arrayOfList
        } else {
            indicadores = arrayOfList.filter { $0.title.localizedCaseInsensitiveContains(query) }
        }
    }
}
