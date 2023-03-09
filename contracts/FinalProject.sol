// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract FinalProject {

    address payable public owner;
    address public customer;

    enum ShippingStatus {PENDING, SHIPPED, DELIVERED}
    ShippingStatus status;

    event MissionComplete();
    event IsShipped();

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier onlyCustomer() {
        require(msg.sender == customer);
        _;
    }

    constructor() public {
        owner = payable(msg.sender);
        status = ShippingStatus.PENDING;
    }

    function setCustomer(address customer) public onlyOwner {
        customer = customer;
    }

    function shipped() public onlyOwner {
        status = ShippingStatus.SHIPPED;
        emit IsShipped();

    }

    function delivered() public onlyOwner {
        status = ShippingStatus.DELIVERED;
        emit MissionComplete();
    }

    function getStatus() public view onlyOwner returns (ShippingStatus) {
        return status;
    }

    function Status() public payable onlyCustomer returns (ShippingStatus) {
        return status;
    }
}
