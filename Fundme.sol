// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0<0.9.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint;
    address[] funders;
    mapping(address=>uint) public addressAmount; 
    uint public constant minimumValue=2*1e18;
    error notEnough();

    function Fund() public payable{
        // require(msg.value.getConverstion() >=minimumValue,"Please send more big value");
        if(msg.value.getConverstion()<minimumValue){
            revert notEnough();
        }
        funders.push(msg.sender);
        addressAmount[msg.sender]=msg.value;
    }

   
}