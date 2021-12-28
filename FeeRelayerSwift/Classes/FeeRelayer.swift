//
//  FeeRelayer.swift
//  FeeRelayerSwift
//
//  Created by Chung Tran on 16/07/2021.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

public protocol FeeRelayerType {
    func getFeePayerPubkey() -> Single<String>
    func sendTransaction(
        _ requestType: FeeRelayer.RequestType
    ) -> Single<String>
    func sendTransaction<T: Decodable>(
        _ requestType: FeeRelayer.RequestType,
        decodedTo: T.Type
    ) -> Single<T>
}

public struct FeeRelayer: FeeRelayerType {
    // MARK: - Constants
    static let feeRelayerUrl = "https://fee-relayer.solana.p2p.org"
    
    // MARK: - Initializers
    public init() {}
    
    // MARK: - Methods
    /// Get fee payer for free transaction
    /// - Returns: Account's public key that is responsible for paying fee
    public func getFeePayerPubkey() -> Single<String>
    {
        request(.get, "\(FeeRelayer.feeRelayerUrl)/fee_payer/pubkey")
            .responseStringCatchFeeRelayerError()
    }
    
    /// Send transaction to fee relayer
    /// - Parameters:
    ///   - path: additional path for request
    ///   - params: request's parameters
    /// - Returns: transaction id
    public func sendTransaction(
        _ requestType: RequestType
    ) -> Single<String> {
        do {
            var urlRequest = try URLRequest(
                url: requestType.url,
                method: .post,
                headers: ["Content-Type": "application/json"]
            )
            urlRequest.httpBody = try requestType.getParams()
            
            return request(urlRequest)
                .responseStringCatchFeeRelayerError()
        } catch {
            return .error(error)
        }
    }
    
    public func sendTransaction<T: Decodable>(
        _ requestType: RequestType,
        decodedTo: T.Type
    ) -> Single<T> {
        do {
            var urlRequest = try URLRequest(
                url: requestType.url,
                method: .post,
                headers: ["Content-Type": "application/json"]
            )
            urlRequest.httpBody = try requestType.getParams()
            
            return request(urlRequest)
                .responseData()
                .take(1)
                .asSingle()
                .map { response, data -> T in
                    // Print
                    guard (200..<300).contains(response.statusCode) else {
                        debugPrint(String(data: data, encoding: .utf8) ?? "")
                        let decodedError = try JSONDecoder().decode(FeeRelayer.Error.self, from: data)
                        throw decodedError
                    }
                    return try JSONDecoder().decode(T.self, from: data)
                }
        } catch {
            return .error(error)
        }
    }
}

private extension ObservableType where Element == DataRequest {
    func responseStringCatchFeeRelayerError(encoding: String.Encoding? = nil) -> Single<String> {
        responseString(encoding: encoding)
            .take(1)
            .asSingle()
            .map { (response, string) in
                // Print
                guard (200..<300).contains(response.statusCode) else {
                    debugPrint(string)
                    guard let data = string.data(using: .utf8) else {
                        throw FeeRelayer.Error.unknown
                    }
                    let decodedError = try JSONDecoder().decode(FeeRelayer.Error.self, from: data)
                    throw decodedError
                }
                return string.replacingOccurrences(of: "[", with: "")
                    .replacingOccurrences(of: "]", with: "")
            }
    }
}
