import Foundation
import Combine

protocol VersionRepository {
    func getVersion() -> AnyPublisher<Version, Error>
}

class DefaultVersionRepository: VersionRepository {
    let http: Http
    let baseUrl: String
    
    init(http: Http = URLSession.shared) {
        self.http = http
        self.baseUrl = "http://localhost:8080"
    }
    
    func getVersion() -> AnyPublisher<Version, Error> {
        let url = URL(string: "\(baseUrl)/api/version")!
        let req = URLRequest(url:url)
        let jsonDecoder = JSONDecoder()
        return http.executeRequest(req)
            .decode(type: Version.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }
}
