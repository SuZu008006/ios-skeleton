@testable import IosSkeleton
import Foundation
import Combine

class DummyVersionRepository: VersionRepository {
    func getVersion() -> AnyPublisher<IosSkeleton.Version, Error> {
        return Future{$0(.success(IosSkeleton.Version(version: "")))}.eraseToAnyPublisher()
    }
}
