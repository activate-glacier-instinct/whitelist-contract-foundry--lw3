// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Whitelist.sol";

contract WhitelistTest is Test {
    Whitelist public whitelist;

    function setUp() public {
        whitelist = new Whitelist(2);
    }

    function testMaxWhitelist() public {
        assertEq(whitelist.maxWhitelistedAddresses(), 2);
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
    function testCannotWhitelistExcedingMax() public {
        // Add more than max addresses
        vm.prank(address(1));
        whitelist.addAddressToWhitelist();
        assertEq(whitelist.numAddressesWhitelisted(), 1);
        vm.prank(address(2));
        whitelist.addAddressToWhitelist();
        assertEq(whitelist.numAddressesWhitelisted(), 2);
        vm.prank(address(3));
        // Should not be able to add to add more address than the original max specified
        vm.expectRevert(bytes("More addresses cant be added, limit reached"));
        whitelist.addAddressToWhitelist();
        // Number of whitelisted addresses should match the max
        assertEq(whitelist.numAddressesWhitelisted(), whitelist.maxWhitelistedAddresses());
    }
}
