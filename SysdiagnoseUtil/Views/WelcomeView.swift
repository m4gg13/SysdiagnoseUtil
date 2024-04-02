//
//  WelcomeView.swift
//  SysdiagnoseUtil
//
//  Created by Maggie Zirnhelt on 3/5/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct WelcomeView: View {

    @State private var dir = URL(fileURLWithPath: "/tmp/")

    @State private var showFileImporter = false
    @State private var canAccess = false

    @AppStorage("bookmarkData") var downloadsBookmark: Data?

    var downloadsUrl: ((Data?) -> URL?) = { downloadsBookmark in
        guard let downloadsBookmark = downloadsBookmark else { return nil }
        var isStale = false
        let url = try? URL(resolvingBookmarkData: downloadsBookmark,
                        bookmarkDataIsStale: &isStale)
        if !isStale {
            return url
        } else {
            return nil
        }
    }

    var stopAcessing: ((URL) -> Void) = { downloadsURL in
        downloadsURL.stopAccessingSecurityScopedResource()
    }

    var body: some View {
        NavigationView {
            VStack {
                Button("Browse fs") {
                    showFileImporter = true
                }
                let downloadsURL = downloadsUrl(downloadsBookmark)
                let showSearchView: Bool = downloadsBookmark != nil
                                           && downloadsURL != nil
                                           && downloadsURL?.startAccessingSecurityScopedResource() ?? false
                if showSearchView, let downloadsURL {
                    Text(downloadsURL.absoluteString)
                }
                Canvas { context, size in
                    let formattedText = Text("Drag and drop here if you'd like")
                    context.draw(formattedText, in: CGRect(origin: .zero, size: size))
                }
                .dropDestination(for: URL.self) { items, location in
                    // TODO: check that it is a sysdiagnose dir before accepting it
                    dir = items.first ?? URL(fileURLWithPath: "/tmp/")
                    return true
                }
                if showSearchView, let downloadsURL {
                    NavigationLink(destination: SearchView(dir: downloadsURL)) {
                        Text("Search within this dir")
                    }
                    NavigationLink(destination: NodeView()) {
                        Text("Open node view")
                    }
                }
            }
            .fileImporter(isPresented: $showFileImporter, allowedContentTypes: [UTType.folder]) { result in
                switch result {
                case .success(let url):
                    // Securely access the URL to save a bookmark
                    guard url.startAccessingSecurityScopedResource() else {
                        // Handle the failure here.
                        return
                    }

                    // We have to stop accessing the resource no matter what
                    defer { url.stopAccessingSecurityScopedResource() }

                    do {
                        // Make sure the bookmark is minimal!
                        downloadsBookmark = try url.bookmarkData(options: .minimalBookmark, includingResourceValuesForKeys: nil, relativeTo: nil)
                    } catch {
                        print("Bookmark error \(error)")
                    }
                case .failure(let error):
                    print("Importer error: \(error)")
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}

/*
 @State private var message = ""

 var body: some View {
 Canvas { context, size in
 let formattedText = Text(message).font(.largeTitle).foregroundStyle(.red)
 context.draw(formattedText, in: CGRect(origin: .zero, size: size))
 }
 .dropDestination(for: String.self) { items, location in
 message = items.first ?? ""
 return true
 }
 }
 */

/*
 @State private var presentedNumbers = [1, 4, 8]

 var body: some View {
 NavigationStack(path: $presentedNumbers) {
 List(1..<50) { i in
 NavigationLink(value: i) {
 Label("Row \(i)", systemImage: "\(i).circle")
 }
 }
 .navigationDestination(for: Int.self) { i in
 Text("Detail \(i)")
 }
 .navigationTitle("Navigation")
 }
 }
 */
