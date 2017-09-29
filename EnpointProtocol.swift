//
//  EnpointProtocol.swift
//  CallTheBuilders
//
//  Created by Pavlo Boiko on 25.05.17.
//  Copyright © 2017 Appinstitute. All rights reserved.
//

import Foundation
import Alamofire

enum RequestMethod : String {
    
    case GET = "get"
    case POST = "post"

}

protocol BaseUrl {
    static var BaseUrl:URL { get }
}

protocol EnpointProtocol : BaseUrl, URLRequestConvertible {
    var parameters: [String: Any]? { get }
    var path: String { get }
    var method: RequestMethod { get }
}

extension EnpointProtocol {

    func asURLRequest() throws -> URLRequest {
        let url = try? Self.BaseUrl.asURL()
        var urlRequest = URLRequest(url: (url?.appendingPathComponent(path))!)
        urlRequest.httpMethod = method.rawValue
        urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)

        return urlRequest
    }
}
