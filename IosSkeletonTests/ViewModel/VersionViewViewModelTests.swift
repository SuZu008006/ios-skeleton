@testable import IosSkeleton
import XCTest
import Combine

class VersionViewViewModelTests: XCTestCase {
    var cancelables = Set<AnyCancellable>()
    
    func test_versionの初期値をpublishする() {
        // act
        let viewModel = VersionView.ViewModel(
            versionRepository: DummyVersionRepository()
        )
        
        // assert
        XCTAssertEqual(viewModel.version, "")
    }
    
    func test_loadを実行したときversionRepositoryのgetVersionをcallする() {
        // arrange
        let spyVersionRepository = SpyVersionRepository()
        
        let viewModel = VersionView.ViewModel(
            versionRepository: spyVersionRepository
        )
        
        // act
        viewModel.load()
        
        // assert
        XCTAssertTrue(spyVersionRepository.getVersion_wasCalled)
    }
    
    func test_loadを実行したときversionRepositoryの値をversionをpublishする() {
        // arrange
        let stubVersionRepository = StubVersionRepository()
        stubVersionRepository.getVersion_returnValue = Version(version: "0.0.1")
        
        let viewModel = VersionView.ViewModel(
            versionRepository: stubVersionRepository
        )
        
        // act
        viewModel.load()
        
        // assert
        XCTAssertEqual(viewModel.version, "0.0.1")
    }
}
