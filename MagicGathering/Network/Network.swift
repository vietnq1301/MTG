//
//  Network.swift
//  MagicGatheringUIKit
//
//  Created by Nguyễn Việt on 25/08/2022.
//

import Foundation

class Network {
    
    enum RequestError: Error {
        case invalidUrl
        case noHTTPRespone
        case http(status: Int)
        case error(message: String)
        case decodingError
        
        var localizedDescription: String {
            switch self {
            case .invalidUrl:
                return "Invalid URL"
            case .noHTTPRespone:
                return "Not a HTTPRespone"
            case .http(let status):
                return "HTTP error: \(status)"
            case .error(let msg):
                return "\(msg)"
            case .decodingError:
                return "Decoding Error"
            }
        }
    }
    
    enum Constants: String {
        case scheme = "https"
        case host = "api.scryfall.com"
    }
    
    enum Path {
        
        case search
        case randomCard
        case card(id: String)
        
        func path() -> String {
            switch self {
            case .search:
                return "/cards/search"
            case .randomCard:
                return "/cards/random"
            case .card(let id):
                return "/cards/\(id)"
            }
        }
    }
    
    static let shared = Network()
    
    func prepareURLComponents(path: String, queryItems: [URLQueryItem] = []) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = Constants.scheme.rawValue
        urlComponents.host = Constants.host.rawValue
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        return urlComponents
    }
    
    func GET<T: Decodable>(url: URL,completion: @escaping (Result<T, Error>) -> ()) {
        let urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30.0)
        URLSession.shared.dataTask(with: urlRequest) { data, respone, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpRespone = respone as? HTTPURLResponse else {
                completion(.failure(RequestError.noHTTPRespone))
                return
            }

            let statusCode = httpRespone.statusCode
            let successCodes: CountableRange<Int> = 200..<299
            let failureCodes: CountableRange<Int> = 400..<499
            
            if successCodes.contains(statusCode) {
            // API request return success and begin to decode
                do {
                    let decodeData = try JSONDecoder().decode(T.self, from: data!)
                    completion(.success(decodeData))
                    return
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }

            } else if failureCodes.contains(statusCode) {
                // API request return error
//                let data = data
//                let responseBody = try JSONSerialization.jsonObject(with: data, options: [])
//                debugPrint(responseBody)
                completion(.failure(RequestError.http(status: statusCode)))
                return

            } else {
                // Server returned response with status code different than expected `successCodes`.
                let info = [
                    NSLocalizedDescriptionKey: "Request failed with code \(statusCode)",
                    NSLocalizedFailureReasonErrorKey: "Wrong handling logic, wrong endpoing mapping or backend bug."
                ]
                let error = NSError(domain: "NetworkService", code: 0, userInfo: info)
                completion(.failure(error))
                return
            }
        }
        .resume()
    }
}

extension Network {
    func getSearchCards(query: String,completion: @escaping (Result<ListCard, Error>) -> Void) {
        let path = Network.Path.search.path()
        let queryItems = [URLQueryItem(name: "q", value: query)]
        let url = prepareURLComponents(path: path,queryItems: queryItems).url
        guard let url = url else {
            completion(.failure(Network.RequestError.invalidUrl))
            return
        }
        GET(url: url, completion: completion)
    }
}

