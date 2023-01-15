import ethers from 'ethers'
import MerkleRegistryABI from './abi/MerkleRegistry'


export class MerkleProofService {

    provider: ethers.providers.WebSocketProvider;
    merkleRegistry: ethers.Contract;

    constructor() {
        this.provider = new ethers.providers.WebSocketProvider("wss://polygon-mumbai.g.alchemy.com/v2/KWo03EtX54m_F8Hfarz6xYA3Jv-G9UGi");
        this.merkleRegistry = new ethers.Contract("", MerkleRegistryABI, this.provider);
    }


    writeMerkle() {
        this.provider.on("block", (blockNumber) => {

        })
    }
}