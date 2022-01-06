// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

import "https://github.com/xuliangshao/opendog/tree/main/contracts/lib/utils/Context.sol";
import "https://github.com/xuliangshao/opendog/tree/main/contracts/lib/contracts/ERC165.sol";
import "https://github.com/xuliangshao/opendog/tree/main/contracts/lib/contracts/ERC721.sol";
import "https://github.com/xuliangshao/opendog/tree/main/contracts/lib/interface/IERC721Enumerable.sol";

contract ERC721Burnable is Context, ERC721 {
  /**
   * @dev Burns a specific ERC721 token.
   * @param tokenId uint256 id of the ERC721 token to be burned.
   */
  function burn(uint256 tokenId) public {
    //solhint-disable-next-line max-line-length
    require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721Burnable: caller is not owner nor approved");
    _burn(tokenId);
  }
}
