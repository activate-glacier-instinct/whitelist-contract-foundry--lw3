// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Whitelist.sol";

contract WhitelistTest is Test {
    Whitelist public whitelist;

    function setUp() public {
        whitelist = new Whitelist(10);
    }

    function testMaxWhitelist() public {
        assertEq(whitelist.maxWhitelistedAddresses(), 10);
    }

    function testAddToWhitelist() public {
        // Should be able to add an address to the whitelist
        vm.prank(address(0));
        whitelist.addAddressToWhitelist();
        assertEq(whitelist.numAddressesWhitelisted(), 1);
    }
    function testFailAddToWhitelist() public {
        // Should not be able to add the same address twice
        vm.prank(address(0));
        vm.expectRevert(bytes("Sender has already been whitelisted"));
        whitelist.addAddressToWhitelist();
        assertEq(whitelist.numAddressesWhitelisted(), 1);
    }
}
