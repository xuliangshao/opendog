// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

import "https://github.com/xuliangshao/opendog/tree/main/contracts/lib/utils/Ownable.sol";
import "https://github.com/xuliangshao/opendog/tree/main/contracts/exchange/OperatorRole.sol";

contract OwnableOperatorRole is Ownable, OperatorRole {
    function addOperator(address account) external onlyOwner {
        _addOperator(account);
    }

    function removeOperator(address account) external onlyOwner {
        _removeOperator(account);
    }
}
