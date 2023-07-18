import Foundation
import Combine

extension VersionView {
    class ViewModel: ObservableObject {
        @Published var version = ""
        
        private let versionRepository: VersionRepository
        
        private var cancellables = Set<AnyCancellable>()

        init(
            versionRepository: VersionRepository = DefaultVersionRepository()
        ){
            self.versionRepository = versionRepository
        }
        
        func load() {
            versionRepository.getVersion()
                .sink(receiveCompletion: {_ in}, receiveValue: {version in self.version = version.version}).store(in: &cancellables)
        }
    }
}
