import SwiftUI

struct VersionView: View {
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel=viewModel
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!!!!!!")
        }
        .padding()
    }
}

struct VersionView_Previews: PreviewProvider {
    static var previews: some View {
        VersionView(viewModel: .init())
    }
}
