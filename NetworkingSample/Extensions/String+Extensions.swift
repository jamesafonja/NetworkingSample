//
//  String+Extensions.swift
//  NetworkingSample
//
//  Created by James Afonja on 11/13/24.
//

import Foundation

extension String {
    var isNotEmpty: Bool {
        return !self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
