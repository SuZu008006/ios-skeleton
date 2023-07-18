@testable import IosSkeleton
import Foundation
import Combine

class DummyVersionRepository: VersionRepository {
    func getVersion() -> AnyPublisher<IosSkeleton.Version, Error> {
        return Future{$0(.success(IosSkeleton.Version(version: "")))}.eraseToAnyPublisher()
    }
}

class SpyVersionRepository: VersionRepository {
    var getVersion_wasCalled = false
    
    func getVersion() -> AnyPublisher<IosSkeleton.Version, Error> {
        self.getVersion_wasCalled = true
        return Future{$0(.success(IosSkeleton.Version(version: "")))}.eraseToAnyPublisher()
    }
}

class StubVersionRepository: VersionRepository {
    var getVersion_returnValue = IosSkeleton.Version(version: "")
    
    func getVersion() -> AnyPublisher<IosSkeleton.Version, Error> {
    
        return Future{$0(.success(self.getVersion_returnValue))}.eraseToAnyPublisher()
    }
}
