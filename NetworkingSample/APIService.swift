//
//  APIService.swift
//  NetworkingSample
//
//  Created by James Afonja on 11/13/24.
//

import Foundation

protocol APIRequest {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: String]? { get }
    var body: [String: Any]? { get }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
}

enum APIServiceError: Error {
    case badURL
    case badStatus(code: Int)
    case decoderError(_ description: String)
    case encoderError(_ description: String)
}

protocol APIService {
    func send<T: Decodable>(
        apiRequest: APIRequest,
        responseType: T.Type,
        additionalParameters: [String: String]?,
        completion: @escaping (Result<T, APIServiceError>) -> Void
    )
}
