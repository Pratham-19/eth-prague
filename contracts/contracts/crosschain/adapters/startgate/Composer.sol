// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
 
import { ILayerZeroComposer } from "@layerzerolabs/lz-evm-protocol-v2/contracts/interfaces/ILayerZeroComposer.sol";
 
contract ComposerReceiver is ILayerZeroComposer {
    event ComposeAcknowledged(address indexed _from, bytes32 indexed _guid, bytes _message, address _executor, bytes _extraData);
 
    uint256 public acknowledgedCount;
 
    function lzCompose(
        address _from,
        bytes32 _guid,
        bytes calldata _message,
        address _executor,
        bytes calldata _extraData
    ) external payable {
        acknowledgedCount++;
 
        emit ComposeAcknowledged(_from, _guid, _message, _executor, _extraData);
    }
 
    fallback() external payable {}
    receive() external payable {}
}