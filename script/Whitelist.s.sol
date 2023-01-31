// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import { Whitelist } from '../src/Whitelist.sol';

contract WhitelistScript is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();
        new Whitelist(2); // Max whitelist is 2 addresses
    }
}
