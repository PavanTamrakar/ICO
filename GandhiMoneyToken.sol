//SPDX-Licence-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/conracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./IGandhiMoney.sol";

contract GandhiMoneyToken is ERC20, Ownable {
    
    IGandhiMoney GandhiMoneyNFT;

    constructor(address _GandhiMoneyContract) ERC20 ("Gandhi Money Token", "GM"); {
        GandhiMoneyNFT = IGandhiMoney(_GandhiMoneyContracts);
    }

    function claim() public {
        address sender = msg.sender;
        uint256 balance = GandhiMoneyNFT.balanceOf(sender);
        require(balance > 0, "No NFT");

        for(uint256 i = 0; i < balance; i++) {
            uint256 tokenId = GandhiMoneyNFT.tokenOfOwnerByIndex(sender, i);

        }
    }
}
