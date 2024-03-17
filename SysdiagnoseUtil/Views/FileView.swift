//
//  FileView.swift
//  SysdiagnoseUtil
//
//  Created by Maggie Zirnhelt on 3/5/24.
//

import Foundation
import SwiftUI

struct FileView: View {
    let url: URL

    var body: some View {
        VStack(alignment: .leading) {
            Text(url.absoluteString)
                .font(.headline)
        }
    }
}

#Preview {
    let tmp = URL(fileURLWithPath: "/tmp/")
    return FileView(url: tmp)
}
