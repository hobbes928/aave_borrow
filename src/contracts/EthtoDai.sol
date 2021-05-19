// SPDX-License-Identifier: agpl-3.0
pragma solidity ^0.6.12;

//import protocol-v2 interface contracts to interact with AAVE contracts
//import IERC20 to approve for deposit
import "@aave/protocol-v2/contracts/interfaces/ILendingPoolAddressesProvider.sol";
import "@aave/protocol-v2/contracts/interfaces/ILendingPool.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EthtoDai {

    //Variables
    ILendingPoolAddressesProvider provider;
    address _wEthAddress = address(0xcc9a0B7c43DC2a5F023Bb9b738E45B0Ef6B06E04); // wETH Gateway address: https://docs.aave.com/developers/v/2.0/deployed-contracts/deployed-contracts
    address _daiAddress = address(0x778A13D3eeb110A4f7bb6529F99c000119a08E92); // DAI stable debt address:https://docs.aave.com/developers/v/2.0/deployed-contracts/deployed-contracts
    uint16 _referralCode = 0; // use zero for no referral
    uint256 _stableRate = 1; // use 1 for stable rate borrow
    
    //Events
    event Main(address _from, uint256 _ethAmount, uint256 _daiamount);
    
    constructor () public {
        provider = ILendingPoolAddressesProvider(address(0xB53C1a33016B2DC2fF3653530bfF1848a515c8c5)); //// mainnet address, for other addresses: https://docs.aave.com/developers/developing-on-aave/deployed-contract-instances
        
    }


function main(uint256 _deposit, uint256 _borrow) external returns(bool) { 
//Retrieve the lending pool contract address from LendingPoolAdressProvider
ILendingPool lendingPool = ILendingPool(provider.getLendingPool());

//Approve wETH contract to move your Eth
IERC20(_wEthAddress).approve(provider.getLendingPool(), _deposit);

//Deposit Eth
// _deposit: is the deposit emount in wei
// msg.sender: eth will be deposited from this account
lendingPool.deposit(_wEthAddress, _deposit, msg.sender, _referralCode);

//Borrow Dai
// _borrow: is the amount being borrowed
// msg.sender: is the address that the borrowed funds will go to
lendingPool.borrow(_daiAddress, _borrow, _stableRate, _referralCode, msg.sender);

emit Main(msg.sender, _deposit, _borrow);
return true;

}


}