//
//  ContentView.swift
//  BucketList
//
//  Created by Alonso Acosta on 23/02/26.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed!")
    }
}

struct ContentView: View {
    @State private var loadingState: LoadingState = .loading
    
    enum LoadingState {
        case loading
        case success
        case failed
    }
    
    var body: some View {
        switch loadingState {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failed:
            FailedView()
        }
    }
}

#Preview {
    ContentView()
}
