//
//  SearchBar.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 05/09/23.
//

import SwiftUI

import SwiftUI

public extension View {
    func navigationSearchBar(text: Binding<String>, scopeSelection: Binding<Int> = Binding.constant(0), options: [NavigationSearchBarOptionKey : Any] = [NavigationSearchBarOptionKey : Any](), actions: [NavigationSearchBarActionKey : NavigationSearchBarActionTask] = [NavigationSearchBarActionKey : NavigationSearchBarActionTask]()) -> some View {
        overlay(NavigationSearchBar<AnyView>(text: text, scopeSelection: scopeSelection, options: options, actions: actions).frame(width: 0, height: 0))
    }

    func navigationSearchBar<SearchResultsContent>(text: Binding<String>, scopeSelection: Binding<Int> = Binding.constant(0), options: [NavigationSearchBarOptionKey : Any] = [NavigationSearchBarOptionKey : Any](), actions: [NavigationSearchBarActionKey : NavigationSearchBarActionTask] = [NavigationSearchBarActionKey : NavigationSearchBarActionTask](), @ViewBuilder searchResultsContent: @escaping () -> SearchResultsContent) -> some View where SearchResultsContent : View {
        overlay(NavigationSearchBar<SearchResultsContent>(text: text, scopeSelection: scopeSelection, options: options, actions: actions, searchResultsContent: searchResultsContent).frame(width: 0, height: 0))
    }
}

public struct NavigationSearchBarOptionKey: Hashable, Equatable, RawRepresentable {
    public static let automaticallyShowsSearchBar = NavigationSearchBarOptionKey("automaticallyShowsSearchBar")
    public static let obscuresBackgroundDuringPresentation = NavigationSearchBarOptionKey("obscuresBackgroundDuringPresentation")
    public static let hidesNavigationBarDuringPresentation = NavigationSearchBarOptionKey("hidesNavigationBarDuringPresentation")
    public static let hidesSearchBarWhenScrolling = NavigationSearchBarOptionKey("hidesSearchBarWhenScrolling")
    public static let placeholder = NavigationSearchBarOptionKey("Placeholder")
    public static let showsBookmarkButton = NavigationSearchBarOptionKey("showsBookmarkButton")
    public static let scopeButtonTitles = NavigationSearchBarOptionKey("scopeButtonTitles")
    
    public static func == (lhs: NavigationSearchBarOptionKey, rhs: NavigationSearchBarOptionKey) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
    
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public init(_ rawValue: String) {
        self.init(rawValue: rawValue)
    }
}

public struct NavigationSearchBarActionKey: Hashable, Equatable, RawRepresentable {
    public static let onCancelButtonClicked = NavigationSearchBarActionKey("onCancelButtonClicked")
    public static let onSearchButtonClicked = NavigationSearchBarActionKey("onSearchButtonClicked")
    public static let onBookmarkButtonClicked = NavigationSearchBarActionKey("onBookmarkButtonClicked")

    public static func == (lhs: NavigationSearchBarActionKey, rhs: NavigationSearchBarActionKey) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
    
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public init(_ rawValue: String) {
        self.init(rawValue: rawValue)
    }
}

public typealias NavigationSearchBarActionTask = () -> Void

fileprivate struct NavigationSearchBar<SearchResultsContent>: UIViewControllerRepresentable where SearchResultsContent : View {
    typealias UIViewControllerType = Wrapper
    typealias OptionKey = NavigationSearchBarOptionKey
    typealias ActionKey = NavigationSearchBarActionKey
    typealias ActionTask = NavigationSearchBarActionTask

    @Binding var text: String
    @Binding var scopeSelection: Int
    
    let options: [OptionKey : Any]
    let actions: [ActionKey : ActionTask]
    let searchResultsContent: () -> SearchResultsContent?
    
    init(text: Binding<String>, scopeSelection: Binding<Int> = Binding.constant(0), options: [OptionKey : Any] = [OptionKey : Any](), actions: [ActionKey : ActionTask] = [ActionKey : ActionTask](), @ViewBuilder searchResultsContent: @escaping () -> SearchResultsContent? = { nil }) {
        self._text = text
        self._scopeSelection = scopeSelection
        self.options = options
        self.actions = actions
        self.searchResultsContent = searchResultsContent
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(representable: self)
    }
    
    func makeUIViewController(context: Context) -> Wrapper {
        Wrapper()
    }
    
    func updateUIViewController(_ wrapper: Wrapper, context: Context) {
        if wrapper.searchController != context.coordinator.searchController {
            wrapper.searchController = context.coordinator.searchController
        }
        
        if let hidesSearchBarWhenScrolling = options[.hidesSearchBarWhenScrolling] as? Bool {
            wrapper.hidesSearchBarWhenScrolling = hidesSearchBarWhenScrolling
        }
        
        if options[.automaticallyShowsSearchBar] as? Bool == nil || options[.automaticallyShowsSearchBar] as! Bool  {
            wrapper.navigationBarSizeToFit()
        }

        if let searchController = wrapper.searchController {
            searchController.automaticallyShowsScopeBar = true
            
            if let obscuresBackgroundDuringPresentation = options[.obscuresBackgroundDuringPresentation] as? Bool {
                searchController.obscuresBackgroundDuringPresentation = obscuresBackgroundDuringPresentation
            } else {
                searchController.obscuresBackgroundDuringPresentation = false
            }
            
            if let hidesNavigationBarDuringPresentation = options[.hidesNavigationBarDuringPresentation] as? Bool {
                searchController.hidesNavigationBarDuringPresentation = hidesNavigationBarDuringPresentation
            }

            if let searchResultsContent = searchResultsContent() {
                (searchController.searchResultsController as? UIHostingController<SearchResultsContent>)?.rootView = searchResultsContent
            }
        }
        
        if let searchBar = wrapper.searchController?.searchBar {
            searchBar.text = text
            
            if let placeholder = options[.placeholder] as? String {
                searchBar.placeholder = placeholder
            }
            
            if let showsBookmarkButton = options[.showsBookmarkButton] as? Bool {
                searchBar.showsBookmarkButton = showsBookmarkButton
            }
            
            if let scopeButtonTitles = options[.scopeButtonTitles] as? [String] {
                searchBar.scopeButtonTitles = scopeButtonTitles
            }
            
            searchBar.selectedScopeButtonIndex = scopeSelection
        }
    }
    
    class Coordinator: NSObject, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
        let representable: NavigationSearchBar
        
        let searchController: UISearchController
        
        init(representable: NavigationSearchBar) {
            self.representable = representable
            
            var searchResultsController: UIViewController? = nil
            if let searchResultsContent = representable.searchResultsContent() {
                searchResultsController = UIHostingController<SearchResultsContent>(rootView: searchResultsContent)
            }
            
            self.searchController = UISearchController(searchResultsController: searchResultsController)
            
            super.init()
            
            self.searchController.searchResultsUpdater = self
            self.searchController.searchBar.delegate = self
        }
        
        // MARK: - UISearchResultsUpdating
        func updateSearchResults(for searchController: UISearchController) {
            guard let text = searchController.searchBar.text else { return }
            DispatchQueue.main.async { [weak self] in self?.representable.text = text }
        }
        
        // MARK: - UISearchBarDelegate
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            guard let action = self.representable.actions[.onCancelButtonClicked] else { return }
            DispatchQueue.main.async { action() }
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            guard let action = self.representable.actions[.onSearchButtonClicked] else { return }
            DispatchQueue.main.async { action() }
        }
        
        func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
            guard let action = self.representable.actions[.onBookmarkButtonClicked] else { return }
            DispatchQueue.main.async { action() }
        }
        
        func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
            DispatchQueue.main.async { [weak self] in self?.representable.scopeSelection = selectedScope }
        }
    }
    
    class Wrapper: UIViewController {
        var searchController: UISearchController? {
            get {
                self.parent?.navigationItem.searchController
            }
            set {
                self.parent?.navigationItem.searchController = newValue
            }
        }
        
        var hidesSearchBarWhenScrolling: Bool {
            get {
                self.parent?.navigationItem.hidesSearchBarWhenScrolling ?? true
            }
            set {
                self.parent?.navigationItem.hidesSearchBarWhenScrolling = newValue
            }
        }
        
        func navigationBarSizeToFit() {
            self.parent?.navigationController?.navigationBar.sizeToFit()
        }
    }
}
