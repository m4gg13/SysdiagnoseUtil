//
//  SearchResultView.swift
//  SysdiagnoseUtil
//
//  Created by Maggie Zirnhelt on 3/6/24.
//

import Foundation
import SwiftUI

struct SearchResultView: View {
    let content: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(content)
                .font(.headline)
        }
    }
}
