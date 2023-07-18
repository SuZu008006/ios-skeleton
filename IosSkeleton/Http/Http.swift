import Foundation
import Combine

protocol Http {
    func executeRequest(_ request: URLRequest) -> AnyPublisher<Data, URLError>
}
