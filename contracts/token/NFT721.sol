// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;
// OpenDog NFT721
import "../lib/interface/IERC721.sol";
import "../lib/contracts/ERC721Base.sol";
import "../lib/utils/SignerRole.sol";
import "../lib/utils/Ownable.sol";
// OpenDog NFT721
/**
 * @title OpenDog NFT721
 * @dev anyone can mint token.
 */
contract NFT721 is Ownable, SignerRole, IERC721, ERC721Base {
	// OpenDog NFT721
	
    constructor (string memory name, string memory symbol, address signer, string memory contractURI, string memory tokenURIPrefix) ERC721Base(name, symbol, contractURI, tokenURIPrefix) {
        _registerInterface(bytes4(keccak256('MINT_WITH_ADDRESS')));
        _addSigner(signer);
        // transferOwnership(newOwner);
    }
	
	// OpenDog NFT721
    function addSigner(address account) public override onlyOwner {
        _addSigner(account);
    }
	
	// OpenDog NFT721
    function removeSigner(address account) public onlyOwner {
        _removeSigner(account);
    }

	// OpenDog NFT721
    function mint(uint256 tokenId, uint8 v, bytes32 r, bytes32 s, Fee[] memory _fees, string memory tokenURI) public {
        require(isSigner(ecrecover(keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", keccak256(abi.encodePacked(this, tokenId)))), v, r, s)), "owner should sign tokenId");
        _mint(msg.sender, tokenId, _fees);
        _setTokenURI(tokenId, tokenURI);
    }
	// OpenDog NFT721

    function setTokenURIPrefix(string memory tokenURIPrefix) public onlyOwner {
        _setTokenURIPrefix(tokenURIPrefix);
    }

	// OpenDog NFT721
    function setContractURI(string memory contractURI) public onlyOwner {
        _setContractURI(contractURI);
    }
}
