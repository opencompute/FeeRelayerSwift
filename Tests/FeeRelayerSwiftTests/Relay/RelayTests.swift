import XCTest
import SolanaSwift
@testable import FeeRelayerSwift
import OrcaSwapSwift

class RelayTests: XCTestCase {
    
    
//    var solanaClient: SolanaAPIClient!
    var orcaSwap: OrcaSwap!
    var feeRelayer: FeeRelayer!
    
    override func tearDown() async throws {
//        solanaClient = nil
        orcaSwap = nil
        feeRelayer = nil
    }
    
    func loadTest(_ relayTest: RelayTestType) async throws {
        // Initialize services
        
        let network = Network.mainnetBeta
        let accountStorage = try await MockAccountStorage(seedPhrase: relayTest.seedPhrase, network: network)
        let endpoint = APIEndPoint(address: relayTest.endpoint, network: network, additionalQuery: relayTest.endpointAdditionalQuery)
        
        let solanaAPIClient = JSONRPCAPIClient(endpoint: endpoint)
        let blockchainClient = BlockchainClient(apiClient: solanaAPIClient)
        let feeRelayerAPIClient = FeeRelayerSwift.APIClient(baseUrlString: testsInfo.baseUrlString, version: 1)
        
        let contextManager = FeeRelayerContextManagerImpl(
            accountStorage: accountStorage,
            solanaAPIClient: solanaAPIClient,
            feeRelayerAPIClient: feeRelayerAPIClient
        )

        orcaSwap = OrcaSwap(
            apiClient: OrcaSwapSwift.APIClient(
                configsProvider: OrcaSwapSwift.NetworkConfigsProvider(
                    network: "mainnet-beta"
                )
            ),
            solanaClient: solanaAPIClient,
            blockchainClient: blockchainClient,
            accountStorage: accountStorage
        )

        feeRelayer = FeeRelayerService(
            orcaSwap: orcaSwap,
            accountStorage: accountStorage,
            solanaApiClient: solanaAPIClient,
            feeCalculator: DefaultFreeRelayerCalculator(),
            feeRelayerAPIClient: feeRelayerAPIClient,
            deviceType: .iOS,
            buildNumber: "UnitTest"
        )
        
        // Load and update services

        let _ = try await (
            orcaSwap.load(),
            contextManager.update()
        )
    }
}

let testsInfo = try! getDataFromJSONTestResourceFile(fileName: "relay-tests", decodedTo: RelayTestsInfo.self)

struct MockAccountStorage: SolanaAccountStorage {
    let account: Account?
    
    init(seedPhrase: String, network: Network) async throws {
        account = try await .init(phrase: seedPhrase.components(separatedBy: " "), network: network)
    }
    
    func save(_ account: Account) throws {
        // ignore
    }
}
