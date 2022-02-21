import Foundation

struct ClientError {
    static var insufficientFunds: String {
        #"{"code":6,"data":{"ClientError":["RpcError: RpcResponseError {\n    code: -32002,\n    message: \"Transaction simulation failed: Error processing Instruction 3: custom program error: 0x1\",\n    data: SendTransactionPreflightFailure(\n        RpcSimulateTransactionResult {\n            err: Some(\n                InstructionError(\n                    3,\n                    Custom(\n                        1,\n                    ),\n                ),\n            ),\n            logs: Some(\n                [\n                    \"Program 11111111111111111111111111111111 invoke [1]\",\n                    \"Program 11111111111111111111111111111111 success\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA invoke [1]\",\n                    \"Program log: Instruction: InitializeAccount\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA consumed 3392 of 200000 compute units\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA success\",\n                    \"Program 12YKFL4mnZz6CBEGePrf293mEzueQM3h8VLPUJsKpGs9 invoke [1]\",\n                    \"Program log: Process instruction. Program id: 12YKFL4mnZz6CBEGePrf293mEzueQM3h8VLPUJsKpGs9, 7 accounts, data: [3]\",\n                    \"Program log: Instruction: CreateTransitTokenAccount\",\n                    \"Program log: Invoke create transit token account\",\n                    \"Program 11111111111111111111111111111111 invoke [2]\",\n                    \"Program 11111111111111111111111111111111 success\",\n                    \"Program 11111111111111111111111111111111 invoke [2]\",\n                    \"Program 11111111111111111111111111111111 success\",\n                    \"Program 11111111111111111111111111111111 invoke [2]\",\n                    \"Program 11111111111111111111111111111111 success\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA invoke [2]\",\n                    \"Program log: Instruction: InitializeAccount\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA consumed 3272 of 171619 compute units\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA success\",\n                    \"Program 12YKFL4mnZz6CBEGePrf293mEzueQM3h8VLPUJsKpGs9 consumed 32387 of 200000 compute units\",\n                    \"Program 12YKFL4mnZz6CBEGePrf293mEzueQM3h8VLPUJsKpGs9 success\",\n                    \"Program 12YKFL4mnZz6CBEGePrf293mEzueQM3h8VLPUJsKpGs9 invoke [1]\",\n                    \"Program log: Process instruction. Program id: 12YKFL4mnZz6CBEGePrf293mEzueQM3h8VLPUJsKpGs9, 20 accounts, data: [4, 160, 134, 1, 0, 0, 0, 0, 0, 83, 148, 12, 0, 0, 0, 0, 0, 70, 86, 10, 0, 0, 0, 0, 0]\",\n                    \"Program log: Instruction: SplSwapTransitive { amount_in: 100000, transit_minimum_amount: 824403, minimum_amount_out: 677446 }\",\n                    \"Program log: Invoke SPL swap to transit\",\n                    \"Program 9W959DqEETiGZocYWCQPaJ6sBmUzgfxXfqGeTEdp3aQP invoke [2]\",\n                    \"Program log: Instruction: Swap\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA invoke [3]\",\n                    \"Program log: Instruction: Transfer\",\n                    \"Program log: Error: insufficient funds\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA consumed 2135 of 150701 compute units\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA failed: custom program error: 0x1\",\n                    \"Program 9W959DqEETiGZocYWCQPaJ6sBmUzgfxXfqGeTEdp3aQP consumed 20050 of 168616 compute units\",\n                    \"Program 9W959DqEETiGZocYWCQPaJ6sBmUzgfxXfqGeTEdp3aQP failed: custom program error: 0x1\",\n                    \"Program 12YKFL4mnZz6CBEGePrf293mEzueQM3h8VLPUJsKpGs9 consumed 51434 of 200000 compute units\",\n                    \"Program 12YKFL4mnZz6CBEGePrf293mEzueQM3h8VLPUJsKpGs9 failed: custom program error: 0x1\",\n                ],\n            ),\n            accounts: None,\n        },\n    ),\n}"]},"message":"Solana RPC client error: RPC response error -32002: Transaction simulation failed: Error processing Instruction 3: custom program error: 0x1 [37 log messages]"}"#
    }
    
    static var maxNumberOfInstructionsExceeded: String {
        #"{"code":6,"data":{"ClientError":["RpcError: RpcResponseError {\n    code: -32002,\n    message: \"Transaction simulation failed: Error processing Instruction 2: Program failed to complete\",\n    data: SendTransactionPreflightFailure(\n        RpcSimulateTransactionResult {\n            err: Some(\n                InstructionError(\n                    2,\n                    ProgramFailedToComplete,\n                ),\n            ),\n            logs: Some(\n                [\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA invoke [1]\",\n                    \"Program log: Instruction: Approve\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA consumed 2024 of 200000 compute units\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA success\",\n                    \"Program 12YKFL4mnZz6CBEGePrf293mEzueQM3h8VLPUJsKpGs9 invoke [1]\",\n                    \"Program log: Process instruction. Program id: 12YKFL4mnZz6CBEGePrf293mEzueQM3h8VLPUJsKpGs9, 7 accounts, data: [3]\",\n                    \"Program log: Instruction: CreateTransitTokenAccount\",\n                    \"Program log: Invoke create transit token account\",\n                    \"Program 11111111111111111111111111111111 invoke [2]\",\n                    \"Program 11111111111111111111111111111111 success\",\n                    \"Program 11111111111111111111111111111111 invoke [2]\",\n                    \"Program 11111111111111111111111111111111 success\",\n                    \"Program 11111111111111111111111111111111 invoke [2]\",\n                    \"Program 11111111111111111111111111111111 success\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA invoke [2]\",\n                    \"Program log: Instruction: InitializeAccount\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA consumed 3297 of 168619 compute units\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA success\",\n                    \"Program 12YKFL4mnZz6CBEGePrf293mEzueQM3h8VLPUJsKpGs9 consumed 35412 of 200000 compute units\",\n                    \"Program 12YKFL4mnZz6CBEGePrf293mEzueQM3h8VLPUJsKpGs9 success\",\n                    \"Program 12YKFL4mnZz6CBEGePrf293mEzueQM3h8VLPUJsKpGs9 invoke [1]\",\n                    \"Program log: Process instruction. Program id: 12YKFL4mnZz6CBEGePrf293mEzueQM3h8VLPUJsKpGs9, 25 accounts, data: [1, 217, 5, 0, 0, 0, 0, 0, 0, 203, 5, 0, 0, 0, 0, 0, 0, 255, 55, 0, 0, 0, 0, 0, 0]\",\n                    \"Program log: Instruction: TopUpWithSplSwapTransitive { amount_in: 1497, transit_minimum_amount: 1483, minimum_amount_out: 14335 }\",\n                    \"Program log: Invoke create temporary WSOL account: DYacDjBULcif7yLPt5HXhP9K4Tk6jGVhucRMS6yZYbSP\",\n                    \"Program 11111111111111111111111111111111 invoke [2]\",\n                    \"Program 11111111111111111111111111111111 success\",\n                    \"Program 11111111111111111111111111111111 invoke [2]\",\n                    \"Program 11111111111111111111111111111111 success\",\n                    \"Program 11111111111111111111111111111111 invoke [2]\",\n                    \"Program 11111111111111111111111111111111 success\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA invoke [2]\",\n                    \"Program log: Instruction: InitializeAccount\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA consumed 3395 of 138311 compute units\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA success\",\n                    \"Program log: Invoke SPL swap to transit\",\n                    \"Program 9W959DqEETiGZocYWCQPaJ6sBmUzgfxXfqGeTEdp3aQP invoke [2]\",\n                    \"Program log: Instruction: Swap\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA invoke [3]\",\n                    \"Program log: Instruction: Transfer\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA consumed 2712 of 67819 compute units\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA success\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA invoke [3]\",\n                    \"Program log: Instruction: Transfer\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA consumed 2643 of 61743 compute units\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA success\",\n                    \"Program 9W959DqEETiGZocYWCQPaJ6sBmUzgfxXfqGeTEdp3aQP consumed 70262 of 128725 compute units\",\n                    \"Program 9W959DqEETiGZocYWCQPaJ6sBmUzgfxXfqGeTEdp3aQP success\",\n                    \"Program log: Unpack transit token account\",\n                    \"Program log: Invoke SPL swap to destination\",\n                    \"Program 9W959DqEETiGZocYWCQPaJ6sBmUzgfxXfqGeTEdp3aQP invoke [2]\",\n                    \"Program log: Instruction: Swap\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA invoke [3]\",\n                    \"Program log: Instruction: Transfer\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA consumed 2643 of 33206 compute units\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA success\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA invoke [3]\",\n                    \"Program log: Instruction: Transfer\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA consumed 1940 of 1940 compute units\",\n                    \"Program failed to complete: exceeded maximum number of instructions allowed (1940) at instruction #1675\",\n                    \"Program TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA failed: Program failed to complete\",\n                    \"Program 9W959DqEETiGZocYWCQPaJ6sBmUzgfxXfqGeTEdp3aQP consumed 51750 of 51750 compute units\",\n                    \"Program 9W959DqEETiGZocYWCQPaJ6sBmUzgfxXfqGeTEdp3aQP failed: Program failed to complete\",\n                    \"Program 12YKFL4mnZz6CBEGePrf293mEzueQM3h8VLPUJsKpGs9 consumed 200000 of 200000 compute units\",\n                    \"Program 12YKFL4mnZz6CBEGePrf293mEzueQM3h8VLPUJsKpGs9 failed: Program failed to complete\",\n                ],\n            ),\n            accounts: None,\n        },\n    ),\n}"]},"message":"Solana RPC client error: RPC response error -32002: Transaction simulation failed: Error processing Instruction 2: Program failed to complete [64 log messages]"}"#
    }
}