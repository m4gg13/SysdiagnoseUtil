//
//  SearchView.swift
//  SysdiagnoseUtil
//
//  Created by Maggie Zirnhelt on 3/5/24.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct SearchView: View {
    var dir: URL
    var urls: [URL] {
        manager.openDir(dir)
    }

    let manager: SearchManager = .default

    var search: ((String, URL) throws -> [String]) = { query, dir in
        try SearchManager.default.searchForString(query, in: dir)
    }
    @State var searchResults: [String] = []

    @State private var query: String = "pid"

    var body: some View {
//        var searchResults: [String] = []
        VStack {
            Text(dir.absoluteString)
            TextField("Enter your search query", text: $query)
            Button("search") {
                searchResults = try! search(query, dir)
            }

            List(urls, id: \.absoluteString) { url in
                FileView(url: url)
            }

            List(searchResults, id: \.hashValue) { result in
                SearchResultView(content: result)
            }
        }
    }
}

//#Preview {
//    SearchView(dir: URL(fileURLWithPath: "/tmp/"))
//}

