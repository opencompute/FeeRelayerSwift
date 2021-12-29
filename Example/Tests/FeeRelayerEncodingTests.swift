//
//  FeeRelayerEncodingTests.swift
//  FeeRelayerSwift_Tests
//
//  Created by Chung Tran on 28/12/2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
import FeeRelayerSwift

class FeeRelayerEncodingTests: XCTestCase {
    func testEncodingTransferSOLParams() throws {
        let params = FeeRelayer.TransferSolParams(
            sender: "JAmdLePQthdecE7rbgVbz1WUuCT3Q2g74vPbiQWSLxiH",
            recipient: "4VsigVU3tx27Z68jis3Sxvxf2E3rUJKWy77G2xjYVqRa",
            amount: 5000000000,
            signature: "4pDHg6HXrXZ3MdAi7NeJW1LGcc9H83QaXZZXbsiFUhv3S14puroN695ukV4DUvSGq1GUug2oPBLwqG8t8547EXgy",
            blockhash: "2zSkac7x52jjdD18zdDZfKDZpcmrKMq3RXodcN5G7MEx"
        )
        
        let data = try JSONEncoder().encode(params)
        let string = String(data: data, encoding: .utf8)
        XCTAssertEqual(string, #"{"sender_pubkey":"JAmdLePQthdecE7rbgVbz1WUuCT3Q2g74vPbiQWSLxiH","signature":"4pDHg6HXrXZ3MdAi7NeJW1LGcc9H83QaXZZXbsiFUhv3S14puroN695ukV4DUvSGq1GUug2oPBLwqG8t8547EXgy","lamports":5000000000,"recipient_pubkey":"4VsigVU3tx27Z68jis3Sxvxf2E3rUJKWy77G2xjYVqRa","blockhash":"2zSkac7x52jjdD18zdDZfKDZpcmrKMq3RXodcN5G7MEx"}"#)
    }
    
    func testEncodingTransferSPLTokenParams() throws {
        let params = FeeRelayer.TransferSPLTokenParams(
            sender: "DruRdCUMQvZQLRPHPYnmBHtWabfDZqBGsdFR7RaipKQR",
            recipient: "v7dovhZiQJrAho3gMdgBjWFLGNTtwfra2on2fMEKFWC",
            mintAddress: "AYemet2EiYqHUMGmrwwWx5Fhi8oM5nHmmgYJnnU9wnt8",
            authority: "9JVy3p9UZnXkho62drSdJ9nanUx5ykRYuyskTYrP6VDV",
            amount: 10000,
            decimals: 3,
            signature: "3rR2np1ZtgNa9QCnhGCybFXEiHKref7CAvpMA4DEh8yJ8gCF5oXKGzJZ8TEWTzUTQGZNm83CQyjyiSo2VHcQWXJd",
            blockhash: "FyGp8WQvMAMiXs1E3YHRPhQ9KeNquTGu9NdnnKudrF7S"
        )
        
        let data = try JSONEncoder().encode(params)
        let string = String(data: data, encoding: .utf8)
        XCTAssertEqual(string, #"{"amount":10000,"sender_token_account_pubkey":"DruRdCUMQvZQLRPHPYnmBHtWabfDZqBGsdFR7RaipKQR","token_mint_pubkey":"AYemet2EiYqHUMGmrwwWx5Fhi8oM5nHmmgYJnnU9wnt8","decimals":3,"signature":"3rR2np1ZtgNa9QCnhGCybFXEiHKref7CAvpMA4DEh8yJ8gCF5oXKGzJZ8TEWTzUTQGZNm83CQyjyiSo2VHcQWXJd","recipient_pubkey":"v7dovhZiQJrAho3gMdgBjWFLGNTtwfra2on2fMEKFWC","blockhash":"FyGp8WQvMAMiXs1E3YHRPhQ9KeNquTGu9NdnnKudrF7S","authority_pubkey":"9JVy3p9UZnXkho62drSdJ9nanUx5ykRYuyskTYrP6VDV"}"#)
    }
    
    func testEncodingSwapTokenParams() throws {
        let params = FeeRelayer.SwapTokensParams(
            source: "3uetDDizgTtadDHZzyy9BqxrjQcozMEkxzbKhfZF4tG3",
            sourceMint: "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v",
            destination: "CRh1jz9Ahs4ZLdTDtsQqtTh8UWFDFre6NtvFTWXQspeX",
            destinationMint: "Es9vMFrzaCERmJfrF4H2FYD4KCoNkY11McCe8BenwNYB",
            authority: "3h1zGmCwsRJnVk5BuRNMLsPaQu1y2aqXqXDWYCgrp5UG",
            swapAccount: .init(
                pubkey: "8KZjKCNTshjwapD4TjWQonXBdi1Jm4Eks5rgrViK9UCx", // pool.address
                authority: "6Aj1GVxoCiEhhYTk9rNySg2QTgvtqSzR119KynihWH3D", // pool.authority (this.poolTokenMint.mintAuthority)
                transferAuthority: "FYnx7fD72nD2sBq6FbLLC38wGJv6DyKyc94LZ3SNR5Zi", // userTransferAuthority
                source: "EDukSdAegSUtKsGi6wdKTpaBuYK9ZcVj9Uz1f39ffdgi", // pool.swapData.tokenAccountA
                destination: "9oaFyrMCwxKE6kBQRP5v9Jo5Uh39Y5p2fFaqGtcxnjYr", // pool.swapData.tokenAccountB
                poolTokenMint: "3H5XKkE9uVvxsdrFeN4BLLGCmohiQN6aZJVVcJiXQ4WC", // pool.swapData.tokenPool
                poolFeeAccount: "EDuiPgd4PuCXe9h2YieMbH7uUMeB4pgeWnP5hfcPvxu3", // pool.swapData.feeAccount
                amountIn: 1000,
                minimumAmountOut: 22
            ),
            feeCompensationSwapAccount: .init(
                pubkey: "8KZjKCNTshjwapD4TjWQonXBdi1Jm4Eks5rgrViK9UCx", // pool.address
                authority: "6Aj1GVxoCiEhhYTk9rNySg2QTgvtqSzR119KynihWH3D", // pool.authority (this.poolTokenMint.mintAuthority)
                transferAuthority: "FYnx7fD72nD2sBq6FbLLC38wGJv6DyKyc94LZ3SNR5Zi", // userTransferAuthority
                source: "EDukSdAegSUtKsGi6wdKTpaBuYK9ZcVj9Uz1f39ffdgi", // pool.swapData.tokenAccountA
                destination: "9oaFyrMCwxKE6kBQRP5v9Jo5Uh39Y5p2fFaqGtcxnjYr", // pool.swapData.tokenAccountB
                poolTokenMint: "3H5XKkE9uVvxsdrFeN4BLLGCmohiQN6aZJVVcJiXQ4WC", // pool.swapData.tokenPool
                poolFeeAccount: "EDuiPgd4PuCXe9h2YieMbH7uUMeB4pgeWnP5hfcPvxu3", // pool.swapData.feeAccount
                amountIn: 1000,
                minimumAmountOut: 22
            ),
            feePayerWSOLAccountKeypair: "<FeePayer>", // bs58.encode(feePayerWsolAccount.secretKey)
            signature: "3rR2np1ZtgNa9QCnhGCybFXEiHKref7CAvpMA4DEh8yJ8gCF5oXKGzJZ8TEWTzUTQGZNm83CQyjyiSo2VHcQWXJd",
            blockhash: "FyGp8WQvMAMiXs1E3YHRPhQ9KeNquTGu9NdnnKudrF7S"
        )
        
        let data = try JSONEncoder().encode(params)
        let string = String(data: data, encoding: .utf8)
        XCTAssertEqual(string, #"{"destination_token_mint_pubkey":"Es9vMFrzaCERmJfrF4H2FYD4KCoNkY11McCe8BenwNYB","user_authority_pubkey":"3h1zGmCwsRJnVk5BuRNMLsPaQu1y2aqXqXDWYCgrp5UG","fee_payer_wsol_account_keypair":"<FeePayer>","signature":"3rR2np1ZtgNa9QCnhGCybFXEiHKref7CAvpMA4DEh8yJ8gCF5oXKGzJZ8TEWTzUTQGZNm83CQyjyiSo2VHcQWXJd","user_source_token_account_pubkey":"3uetDDizgTtadDHZzyy9BqxrjQcozMEkxzbKhfZF4tG3","user_swap":{"pool_fee_account_pubkey":"EDuiPgd4PuCXe9h2YieMbH7uUMeB4pgeWnP5hfcPvxu3","account_pubkey":"8KZjKCNTshjwapD4TjWQonXBdi1Jm4Eks5rgrViK9UCx","destination_pubkey":"9oaFyrMCwxKE6kBQRP5v9Jo5Uh39Y5p2fFaqGtcxnjYr","amount_in":1000,"source_pubkey":"EDukSdAegSUtKsGi6wdKTpaBuYK9ZcVj9Uz1f39ffdgi","transfer_authority_pubkey":"FYnx7fD72nD2sBq6FbLLC38wGJv6DyKyc94LZ3SNR5Zi","minimum_amount_out":22,"authority_pubkey":"6Aj1GVxoCiEhhYTk9rNySg2QTgvtqSzR119KynihWH3D","pool_token_mint_pubkey":"3H5XKkE9uVvxsdrFeN4BLLGCmohiQN6aZJVVcJiXQ4WC"},"blockhash":"FyGp8WQvMAMiXs1E3YHRPhQ9KeNquTGu9NdnnKudrF7S","user_destination_pubkey":"CRh1jz9Ahs4ZLdTDtsQqtTh8UWFDFre6NtvFTWXQspeX","source_token_mint_pubkey":"EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v","fee_compensation_swap":{"pool_fee_account_pubkey":"EDuiPgd4PuCXe9h2YieMbH7uUMeB4pgeWnP5hfcPvxu3","account_pubkey":"8KZjKCNTshjwapD4TjWQonXBdi1Jm4Eks5rgrViK9UCx","destination_pubkey":"9oaFyrMCwxKE6kBQRP5v9Jo5Uh39Y5p2fFaqGtcxnjYr","amount_in":1000,"source_pubkey":"EDukSdAegSUtKsGi6wdKTpaBuYK9ZcVj9Uz1f39ffdgi","transfer_authority_pubkey":"FYnx7fD72nD2sBq6FbLLC38wGJv6DyKyc94LZ3SNR5Zi","minimum_amount_out":22,"authority_pubkey":"6Aj1GVxoCiEhhYTk9rNySg2QTgvtqSzR119KynihWH3D","pool_token_mint_pubkey":"3H5XKkE9uVvxsdrFeN4BLLGCmohiQN6aZJVVcJiXQ4WC"}}"#)
    }
    
    func testEncodingTopUpWithDirectSwapParams() throws {
        let params = FeeRelayer.RelayTopUpParams(
            userSourceTokenAccountPubkey: "3uetDDizgTtadDHZzyy9BqxrjQcozMEkxzbKhfZF4tG3",
            sourceTokenMintPubkey: "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v",
            userAuthorityPubkey: "6Aj1GVxoCiEhhYTk9rNySg2QTgvtqSzR119KynihWH3D",
            topUpSwap: createRelayDirectSwapParams(index: 0),
            feeAmount: 500000,
            signatures: .init(
                userAuthoritySignature: "3rR2np1ZtgNa9QCnhGCybFXEiHKref7CAvpMA4DEh8yJ8gCF5oXKGzJZ8TEWTzUTQGZNm83CQyjyiSo2VHcQWXJd",
                transferAuthoritySignature: "3rR2np1ZtgNa9QCnhGCybFXEiHKref7CAvpMA4DEh8yJ8gCF5oXKGzJZ8TEWTzUTQGZNm83CQyjyiSo2VHcQWXJd"
            ),
            blockhash: "FyGp8WQvMAMiXs1E3YHRPhQ9KeNquTGu9NdnnKudrF7S"
        )
        
        let data = try JSONEncoder().encode(params)
        let string = String(data: data, encoding: .utf8)
        
        XCTAssertEqual(string, #"{"user_authority_pubkey":"6Aj1GVxoCiEhhYTk9rNySg2QTgvtqSzR119KynihWH3D","top_up_swap":{"pool_fee_account_pubkey":"EDuiPgd4PuCXe9h2YieMbH7uUMeB4pgeWnP5hfcPvxu3","account_pubkey":"3uetDDizgTtadDHZzyy9BqxrjQcozMEkxzbKhfZF4tG3","destination_pubkey":"CRh1jz9Ahs4ZLdTDtsQqtTh8UWFDFre6NtvFTWXQspeX","amount_in":500000,"source_pubkey":"3uetDDizgTtadDHZzyy9BqxrjQcozMEkxzbKhfZF4tG3","transfer_authority_pubkey":"6Aj1GVxoCiEhhYTk9rNySg2QTgvtqSzR119KynihWH3D","minimum_amount_out":500000,"authority_pubkey":"6Aj1GVxoCiEhhYTk9rNySg2QTgvtqSzR119KynihWH3D","program_id":"6Aj1GVxoCiEhhYTk9rNySg2QTgvtqSzR119KynihWH3D","pool_token_mint_pubkey":"3H5XKkE9uVvxsdrFeN4BLLGCmohiQN6aZJVVcJiXQ4WC"},"user_source_token_account_pubkey":"3uetDDizgTtadDHZzyy9BqxrjQcozMEkxzbKhfZF4tG3","signatures":{"user_authority_signature":"3rR2np1ZtgNa9QCnhGCybFXEiHKref7CAvpMA4DEh8yJ8gCF5oXKGzJZ8TEWTzUTQGZNm83CQyjyiSo2VHcQWXJd","transfer_authority_signature":"3rR2np1ZtgNa9QCnhGCybFXEiHKref7CAvpMA4DEh8yJ8gCF5oXKGzJZ8TEWTzUTQGZNm83CQyjyiSo2VHcQWXJd"},"blockhash":"FyGp8WQvMAMiXs1E3YHRPhQ9KeNquTGu9NdnnKudrF7S","fee_amount":500000,"source_token_mint_pubkey":"EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v"}"#)
    }
    
    func testEncodingTopUpWithTransitiveSwapParams() throws {
        let params = FeeRelayer.RelayTopUpParams(
            userSourceTokenAccountPubkey: "3uetDDizgTtadDHZzyy9BqxrjQcozMEkxzbKhfZF4tG3",
            sourceTokenMintPubkey: "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v",
            userAuthorityPubkey: "6Aj1GVxoCiEhhYTk9rNySg2QTgvtqSzR119KynihWH3D",
            topUpSwap: FeeRelayer.TransitiveSwapData(
                from: createRelayDirectSwapParams(index: 0),
                to: createRelayDirectSwapParams(index: 1),
                transitTokenMintPubkey: "3H5XKkE9uVvxsdrFeN4BLLGCmohiQN6aZJVVcJiXQ4WC"
            ),
            feeAmount: 500000,
            signatures: .init(
                userAuthoritySignature: "3rR2np1ZtgNa9QCnhGCybFXEiHKref7CAvpMA4DEh8yJ8gCF5oXKGzJZ8TEWTzUTQGZNm83CQyjyiSo2VHcQWXJd",
                transferAuthoritySignature: "3rR2np1ZtgNa9QCnhGCybFXEiHKref7CAvpMA4DEh8yJ8gCF5oXKGzJZ8TEWTzUTQGZNm83CQyjyiSo2VHcQWXJd"
            ),
            blockhash: "FyGp8WQvMAMiXs1E3YHRPhQ9KeNquTGu9NdnnKudrF7S"
        )
        
        let data = try JSONEncoder().encode(params)
        let string = String(data: data, encoding: .utf8)
        print(NSString(string: string!))
        
        XCTAssertEqual(string, #"{"user_authority_pubkey":"6Aj1GVxoCiEhhYTk9rNySg2QTgvtqSzR119KynihWH3D","top_up_swap":{"to":{"pool_fee_account_pubkey":"EDuiPgd4PuCXe9h2YieMbH7uUMeB4pgeWnP5hfcPvxu3","account_pubkey":"3uetDDizgTtadDHZzyy9BqxrjQcozMEkxzbKhfZF4tG3","destination_pubkey":"CRh2jz9Ahs4ZLdTDtsQqtTh8UWFDFre6NtvFTWXQspeX","amount_in":500000,"source_pubkey":"3uetDDizgTtadDHZzyy9BqxrjQcozMEkxzbKhfZF4tG3","transfer_authority_pubkey":"6Aj2GVxoCiEhhYTk9rNySg2QTgvtqSzR229KynihWH3D","minimum_amount_out":500000,"authority_pubkey":"6Aj2GVxoCiEhhYTk9rNySg2QTgvtqSzR229KynihWH3D","program_id":"6Aj2GVxoCiEhhYTk9rNySg2QTgvtqSzR229KynihWH3D","pool_token_mint_pubkey":"3H5XKkE9uVvxsdrFeN4BLLGCmohiQN6aZJVVcJiXQ4WC"},"transit_token_mint_pubkey":"3H5XKkE9uVvxsdrFeN4BLLGCmohiQN6aZJVVcJiXQ4WC","from":{"pool_fee_account_pubkey":"EDuiPgd4PuCXe9h2YieMbH7uUMeB4pgeWnP5hfcPvxu3","account_pubkey":"3uetDDizgTtadDHZzyy9BqxrjQcozMEkxzbKhfZF4tG3","destination_pubkey":"CRh1jz9Ahs4ZLdTDtsQqtTh8UWFDFre6NtvFTWXQspeX","amount_in":500000,"source_pubkey":"3uetDDizgTtadDHZzyy9BqxrjQcozMEkxzbKhfZF4tG3","transfer_authority_pubkey":"6Aj1GVxoCiEhhYTk9rNySg2QTgvtqSzR119KynihWH3D","minimum_amount_out":500000,"authority_pubkey":"6Aj1GVxoCiEhhYTk9rNySg2QTgvtqSzR119KynihWH3D","program_id":"6Aj1GVxoCiEhhYTk9rNySg2QTgvtqSzR119KynihWH3D","pool_token_mint_pubkey":"3H5XKkE9uVvxsdrFeN4BLLGCmohiQN6aZJVVcJiXQ4WC"}},"user_source_token_account_pubkey":"3uetDDizgTtadDHZzyy9BqxrjQcozMEkxzbKhfZF4tG3","signatures":{"user_authority_signature":"3rR2np1ZtgNa9QCnhGCybFXEiHKref7CAvpMA4DEh8yJ8gCF5oXKGzJZ8TEWTzUTQGZNm83CQyjyiSo2VHcQWXJd","transfer_authority_signature":"3rR2np1ZtgNa9QCnhGCybFXEiHKref7CAvpMA4DEh8yJ8gCF5oXKGzJZ8TEWTzUTQGZNm83CQyjyiSo2VHcQWXJd"},"blockhash":"FyGp8WQvMAMiXs1E3YHRPhQ9KeNquTGu9NdnnKudrF7S","fee_amount":500000,"source_token_mint_pubkey":"EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v"}"#)
    }
}

// MARK: - Helpers
private func createRelayDirectSwapParams(index: Int) -> FeeRelayer.DirectSwapData {
    FeeRelayer.DirectSwapData(
        programId: "6Aj\(index+1)GVxoCiEhhYTk9rNySg2QTgvtqSzR\(index+1)\(index+1)9KynihWH3D",
        accountPubkey: "3uetDDizgTtadDHZzyy9BqxrjQcozMEkxzbKhfZF4tG3",
        authorityPubkey: "6Aj\(index+1)GVxoCiEhhYTk9rNySg2QTgvtqSzR\(index+1)\(index+1)9KynihWH3D",
        transferAuthorityPubkey: "6Aj\(index+1)GVxoCiEhhYTk9rNySg2QTgvtqSzR\(index+1)\(index+1)9KynihWH3D",
        sourcePubkey: "3uetDDizgTtadDHZzyy9BqxrjQcozMEkxzbKhfZF4tG3",
        destinationPubkey: "CRh\(index+1)jz9Ahs4ZLdTDtsQqtTh8UWFDFre6NtvFTWXQspeX",
        poolTokenMintPubkey: "3H5XKkE9uVvxsdrFeN4BLLGCmohiQN6aZJVVcJiXQ4WC",
        poolFeeAccountPubkey: "EDuiPgd4PuCXe9h2YieMbH7uUMeB4pgeWnP5hfcPvxu3",
        amountIn: 500000,
        minimumAmountOut: 500000
    )
}
