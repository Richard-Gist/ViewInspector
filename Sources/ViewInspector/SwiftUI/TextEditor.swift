import SwiftUI

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
public extension ViewType {
    
    struct TextEditor: KnownViewType {
        public static var typePrefix: String = "TextEditor"
    }
}

// MARK: - Extraction from SingleViewContent parent

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
public extension InspectableView where View: SingleViewContent {
    
    func textEditor() throws -> InspectableView<ViewType.TextEditor> {
        return try .init(try child(), parent: self)
    }
}

// MARK: - Extraction from MultipleViewContent parent

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
public extension InspectableView where View: MultipleViewContent {
    
    func textEditor(_ index: Int) throws -> InspectableView<ViewType.TextEditor> {
        return try .init(try child(at: index), parent: self)
    }
}

// MARK: - Custom Attributes

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
public extension InspectableView where View == ViewType.TextEditor {
    
    func input() throws -> String {
        return try inputBinding().wrappedValue
    }
    
    func setInput(_ value: String) throws {
        try inputBinding().wrappedValue = value
    }
    
    private func inputBinding() throws -> Binding<String> {
        return try Inspector.attribute(
            label: "_text", value: content.view, type: Binding<String>.self)
    }
}
