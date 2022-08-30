//SPDX-Licence-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/conracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./IGandhiMoney.sol";

contract GandhiMoneyToken is ERC20, Ownable {

    uint256 public constant tokenPrice = 0.001 ether;
    
    uint256 public constant tokensPerNft = 10*10**18;

    uint256 public constant maxTokensupply = 10000*10**18;

    mapping(uint256 => bool) public tokenIdsClaimed;

    IGandhiMoney GandhiMoneyNFT;

    constructor(address _GandhiMoneyContract) ERC20 ("Gandhi Money Token", "GM"); {
        GandhiMoneyNFT = IGandhiMoney(_GandhiMoneyContracts);
    }

    function mint(uint256 amount) public payable{
        
    }

    function claim() public {
        address sender = msg.sender;
        uint256 balance = GandhiMoneyNFT.balanceOf(sender);
        require(balance > 0, "No NFT");
        uint256 amount = 0;

        for(uint256 i = 0; i < balance; i++) {
            uint256 tokenId = GandhiMoneyNFT.tokenOfOwnerByIndex(sender, i);
            if (!tokenIdsClaimed[tokenId]) {
                  amount += 1;
                  tokenIdsClaimed[tokenId] = true;
        }

        require(amount > 0, "Already claimed your tokens1");
        _mint(msg.sender, amount * tokenPerNft);
    }

    function withdraw() public onlyOwner {
        address _owner = owner();
        uint256 amount = address(this).balance;
        (bool sent, ) = _owner.call{value: amount}("");
        require(sent, "Failed to send Ether");
    }
    receiver() external payable{}

    fallback() external payable{}
}
