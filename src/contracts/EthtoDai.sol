// SPDX-License-Identifier: agpl-3.0
pragma solidity ^0.6.12;

import {LendingPoolAddressesProvider} from '@aave/protocol-v2/contracts/protocol/configuration/LendingPoolAddressesProvider.sol';
import {LendingPool, IERC20} from '@aave/protocol-v2/contracts/protocol/lendingpool/LendingPool.sol';

//import '@openzeppelin/contracts/token/ERC20/IERC20.sol';


contract EthtoDai {

    LendingPoolAddressesProvider provider;
    address _wEthAddress = 0xcc9a0B7c43DC2a5F023Bb9b738E45B0Ef6B06E04;
    uint16 _referralCode = 0;
    address _daiAddress = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    uint256 _variableRate = 1;


function main(uint256 _eth, uint256 _dai) public returns (bool) {
//require(msg.sender != address(0));
provider = LendingPoolAddressesProvider(address(0xB53C1a33016B2DC2fF3653530bfF1848a515c8c5));
LendingPool lendingPool = LendingPool(provider.getLendingPool());

//Approve LendingPool contract to move your Eth
IERC20(_wEthAddress).approve(provider.getLendingPool(), _eth);

//Deposit Eth
lendingPool.deposit(_wEthAddress, _eth, msg.sender, _referralCode);


//Borrow Dai
lendingPool.borrow(_daiAddress, _dai, _variableRate, _referralCode, msg.sender);


return (true);


}



}
