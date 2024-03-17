//
//  SearchManager.swift
//  SysdiagnoseUtil
//
//  Created by Maggie Zirnhelt on 3/5/24.
//

import Foundation

public struct SearchManager {
    static let `default`: SearchManager = .init()

    let keys: [URLResourceKey] = [.isRegularFileKey, .isDirectoryKey]

    func openDir(_ dir: URL) -> [URL] {
        do {

            return try FileManager.default.contentsOfDirectory(at: dir,
                                                               includingPropertiesForKeys: keys)
        } catch {
            print(error)
        }
        return []
    }

    func searchForString(_ query: String, in dir: URL) throws -> [String] {
        guard let enumerator = FileManager.default.enumerator(at: dir, includingPropertiesForKeys: keys) else {
            throw SearchError.failedToEnumerate
        }
        print("here 1")

        var results: [String] = []

        for case let fileURL as URL in enumerator {
            if let data = FileManager.default.contents(atPath: fileURL.path()),
               let str = String(data: data, encoding: .utf8) {

                let ranges = str.ranges(of: query)
                guard !ranges.isEmpty else {
                    // didn't find any instances of the query string in this file
                    // move on to the next file
                    continue
                }
                for range in ranges {
//                    let contextRange =
                    let result = String(str[range])
                    results.append(result)
                }
            }
        }

        return results
    }
}

enum SearchError: Error {
    case failedToEnumerate
}
