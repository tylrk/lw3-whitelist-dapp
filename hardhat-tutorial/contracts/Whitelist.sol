//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {
    //Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    //Create mapping of whitelistedAddresses
    //If an address is whitelisted, we would set it to true, it is false by default for all other addresses
    mapping(address => bool) public whitelistedAddresses;

    //numAddressesWhitelisted would be used to keep track of how many addys have been whitelisted
    //NOTE: Don't change this variable name, as it will be part of verification 
    uint8 public numAddressesWhitelisted;

    //Setting the number of whitelisted addresses
    //User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    //This function adds the address of the sender to the whitelist
    function addAddressToWhitelist() public {
        //check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Whitelisted addresses limit reached");

        //Add the address which called the function to the whitelistedAddresses array
        whitelistedAddresses[msg.sender] = true;
        //Increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }

    // Contract addy: 0x85A8a47Ce1d2F65B558F91e38AC089b0ca876f0B
}