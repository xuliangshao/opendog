// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

import "https://github.com/xuliangshao/opendog/tree/main/contracts/lib/interface/IERC721.sol";
import "https://github.com/xuliangshao/opendog/tree/main/contracts/exchange/OwnableOperatorRole.sol";

contract TransferProxyForDeprecated is OwnableOperatorRole {

    function erc721TransferFrom(IERC721 token, address from, address to, uint256 tokenId) external onlyOperator {
        token.transferFrom(from, to, tokenId);
    }
}
