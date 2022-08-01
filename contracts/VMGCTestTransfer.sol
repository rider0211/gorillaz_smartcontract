// SPDX-License-Identifier: MIT

pragma solidity <=0.8.1;

import "./Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

/*
    In the game, we need to transfer 1 token to player's wallet if they get 300 points.
    So we need to create this contract.
 */

contract VMGCTestTransfer is Ownable {
    using SafeERC20 for IERC20;

    IERC20 VMGCAddress;

    constructor(IERC20 _VMGCAddress) public {
        VMGCAddress = _VMGCAddress;
        _transferOwnership(_msgSender());
    }

    function TransferVMGC() public {
        VMGCAddress.safeTransfer(address(msg.sender), 1000000000000000000);
    }

}
