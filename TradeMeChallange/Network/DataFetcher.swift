//
//  DataFetcher.swift
//  TradeMeChallange
//
//  Created by Inti Albuquerque on 26/10/22.
//

import Foundation

protocol DecoderProtocol {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
}

protocol EncoderProtocol {
    func encode<T>(_ value: T) throws -> Data where T : Encodable
}
extension JSONDecoder: DecoderProtocol {}
extension JSONEncoder: EncoderProtocol {}

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

enum DataFetcherUtils {
    private static let decoder = JSONDecoder()
    static let encoder = JSONEncoder()
    static func defaultDecoder(
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase
    ) -> JSONDecoder {
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}

extension Encodable {
    func encode(encoder: EncoderProtocol) -> Data? {
        return try? encoder.encode(self)
    }
}

struct DataFetcherRequest {
    private static let authString = "OAuth oauth_consumer_key=\"A1AC63F0332A131A78FAC304D007E7D1\",oauth_signature_method=\"PLAINTEXT\",oauth_signature=\"EC7F18B17A062962C6930A8AE88B16C7&\""
    
    let endpoint: EndPoint
    private var headers: [String: String]
    private let body: Data?
    private let httpMethod: HTTPMethod
    
    init(endpoint: EndPoint,
         headers: [String: String]? = nil,
         reqBody: Encodable? = nil,
         httpMethod: HTTPMethod,
         encoder: EncoderProtocol = DataFetcherUtils.encoder
    ) {
        self.endpoint = endpoint
        self.headers = headers ?? [:]
        self.body = reqBody?.encode(encoder: encoder)
        self.httpMethod = httpMethod
        self.headers["Authorization"] = DataFetcherRequest.authString
    }
    
    func buildURLRequest(with url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = body
        return urlRequest
    }
}

struct DataFetcherError: Error {
    let title: String
    let message: String
}

protocol DataFetcherProtocol {
    var requestTimeOut: Float { get }
    
    func request<ResponseType: Decodable>(_ req: DataFetcherRequest, decoder: DecoderProtocol) async throws -> ResponseType
}

actor DataFetcher: DataFetcherProtocol {
    
    static let defaultDataFetcher = DataFetcher()
    
    let requestTimeOut: Float
    
    init(requestTimeOut: Float = 30) {
        self.requestTimeOut = requestTimeOut
    }
    
    func request<ResponseType: Decodable>(
        _ req: DataFetcherRequest,
        decoder: DecoderProtocol = DataFetcherUtils.defaultDecoder()) async throws -> ResponseType {
            
            let sessionConfig = URLSessionConfiguration.default
            sessionConfig.timeoutIntervalForRequest = TimeInterval(requestTimeOut)
            
            guard let url = req.endpoint.buildUrl() else {
                throw DataFetcherError(
                    title: "InvalidUrlTitle".localized,
                    message: "InvalidUrlMessage".localized
                )
            }
            let data = try await URLSession.shared.data(for: req.buildURLRequest(with: url))
            return try decoder.decode(ResponseType.self, from: data.0)
        }
}
