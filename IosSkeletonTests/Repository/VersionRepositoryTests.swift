@testable import IosSkeleton
import XCTest
import Combine

class VersionRepositoryTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    
    func test_urlとmethodを渡す() {
        // arrange
        let spyHttp = SpyHttp()
        
        // act
        let repository = DefaultVersionRepository(http: spyHttp)
        _ = repository.getVersion()
        
        // assert
        XCTAssertEqual(
            spyHttp.executeRequest_argument_request?.url?.description, "http://localhost:8080/api/version"
        )
        XCTAssertEqual(
            spyHttp.executeRequest_argument_request?.httpMethod,
            "GET"
        )
    }
    
    func test_versionを返す() throws{
        // arrange
        let json = """
            {"version": "0.0.1"}
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let stubHttp = StubHttp(returning: data)
        let reposiotry = DefaultVersionRepository(http: stubHttp)
        
        // act
        let expection = XCTestExpectation()
        reposiotry.getVersion()
            .sink(
                receiveCompletion: { _ in },
                receiveValue:{ version in
                    // assert
                    XCTAssertEqual(Version(version: "0.0.1"),version)
                    expection.fulfill()
                    
                }
            )
            .store(in: &cancellables)
        wait(for: [expection], timeout: 1)
    }
}
