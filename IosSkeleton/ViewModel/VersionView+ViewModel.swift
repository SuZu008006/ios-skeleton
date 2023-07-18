import Foundation
import Combine

extension VersionView {
    class ViewModel: ObservableObject {
        @Published var version = ""
        
        private let versionRepository: VersionRepository

        init(
            versionRepository: VersionRepository = DefaultVersionRepository()
        ){
            self.versionRepository = versionRepository
        }
    }
}
