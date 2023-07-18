@testable import IosSkeleton
import XCTest
import Combine

class VersionViewViewModelTests: XCTestCase {
    var cancelables = Set<AnyCancellable>()
    
    func test_versionの初期値をpublishする() {
        let viewModel = VersionView.ViewModel(
            versionRepository: DummyVersionRepository()
        )
        
        XCTAssertEqual(viewModel.version, "")
    }
}
