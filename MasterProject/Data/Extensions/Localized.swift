//
//  Localized.swift
//  MasterProject
//
//  Created by Carlos Dalton on 28/5/23.
//  Copyright © 2023 Carlos Colmenares. All rights reserved.
//

import Foundation

struct LocalizedString {
    var key: String

    init(_ key: String) {
        self.key = key
    }

    func resolve() -> String {
        NSLocalizedString(key, comment: "")
    }
}

extension LocalizedString: ExpressibleByStringLiteral {
    init(stringLiteral value: StringLiteralType) {
        key = value
    }
}
