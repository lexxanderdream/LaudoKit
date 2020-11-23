//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 03.07.2020.
//

import UIKit

#if canImport(SwiftUI) && DEBUG
import SwiftUI

public struct UIViewPreview<LView: UIView>: UIViewRepresentable {
    let view: LView

    public init(_ builder: @escaping () -> LView) {
        view = builder()
    }

    // MARK: - UIViewRepresentable
    public func makeUIView(context: Context) -> UIView {
        return view
    }

    public func updateUIView(_ view: UIView, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
#endif
