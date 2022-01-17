import Foundation
import RxSwift
import SolanaSwift

class FakeAccountStorage: SolanaSDKAccountStorage, OrcaSwapAccountProvider {
    private let seedPhrase: String
    private let network: SolanaSDK.Network
    
    init(seedPhrase: String, network: SolanaSDK.Network) {
        self.seedPhrase = seedPhrase
        self.network = network
    }
    
    func getAccount() -> OrcaSwap.Account? {
        account
    }
    
    func getNativeWalletAddress() -> OrcaSwap.PublicKey? {
        account?.publicKey
    }
    
    var account: SolanaSDK.Account? {
        try! .init(phrase: seedPhrase.components(separatedBy: " "), network: network, derivablePath: .default)
    }
}

class FakeNotificationHandler: OrcaSwapSignatureConfirmationHandler {
    func waitForConfirmation(signature: String) -> Completable {
        .empty()
    }
}
