//
//  String.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 17/09/23.
//

import Foundation
extension String: LocalizedError {
    public var errorDescription: String? { return self }
}
