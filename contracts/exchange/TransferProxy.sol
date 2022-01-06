// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

import "https://github.com/xuliangshao/opendog/tree/main/contracts/lib/interface/IERC721.sol";
import "https://github.com/xuliangshao/opendog/tree/main/contracts/lib/interface/IERC1155.sol";

import "https://github.com/xuliangshao/opendog/tree/main/contracts/exchange/OwnableOperatorRole.sol";

contract TransferProxy is OwnableOperatorRole {

    function erc721safeTransferFrom(IERC721 token, address from, address to, uint256 tokenId) external onlyOperator {
        token.safeTransferFrom(from, to, tokenId);
    }

    function erc1155safeTransferFrom(IERC1155 token, address from, address to, uint256 id, uint256 value, bytes calldata data) external onlyOperator {
        token.safeTransferFrom(from, to, id, value, data);
    }
}
