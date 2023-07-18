@testable import IosSkeleton
import Combine
import Foundation

class DummyHttp: Http {
    func executeRequest(_ request: URLRequest) -> AnyPublisher<Data, URLError> {
        return Future { $0(.success(Data())) }
            .delay(for: 0.01, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

class StubHttp: Http {
    private let data: Data
    
    init(returning data: Data) {
        self.data = data
    }
    
    func executeRequest(_ request: URLRequest) -> AnyPublisher<Data, URLError> {
        return Future { $0(.success(self.data)) }
            .delay(for: 0.01, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

class SpyHttp: Http {
    var executeRequest_argument_request: URLRequest?
    
    func executeRequest(_ request: URLRequest) -> AnyPublisher<Data, URLError> {
        executeRequest_argument_request = request
        
        return Future { $0(.success(Data())) }
            .delay(for: 0.01, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
