// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./ERC20.sol";
import "./ERC20Burnable.sol";
import "./Pausable.sol";
import "./AccessControl.sol";
import "./SafeMath.sol";

contract VMGCTest is ERC20, AccessControl, ERC20Burnable, Pausable {
    using SafeMath for uint256;

    uint256 internal  _maxAmountMintable = 10000000000e18;
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    address operationalAddress;
    address marketingAddress;
    address lpAddress;


    constructor(address _operationalAddress, address _marketingAddress, address _lpAddress) ERC20("VMGCTest", "VMGCTest") {
        operationalAddress = _operationalAddress;
        marketingAddress = _marketingAddress;
        lpAddress = _lpAddress;
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    modifier onlyAdminRole() {
        require(
            hasRole(DEFAULT_ADMIN_ROLE, msg.sender),
            "!admin"
        );
        _;
    }

    function transferOwnership(address newOwner) public onlyAdminRole {
        require(msg.sender != newOwner, "!same address");
        grantRole(DEFAULT_ADMIN_ROLE, newOwner);
        revokeRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    function mint(address _to, uint256 _amount) public onlyAdminRole whenNotPaused {
        require(ERC20.totalSupply().add(_amount) <= _maxAmountMintable, "Max mintable exceeded");
        super._mint(_to, _amount);
    }

    function transfer(address recipient, uint256 amount)
        public
        virtual
        override
        returns (bool)
    {
        uint256 operationalAmount = amount*3/100;
        uint256 marketingAmount = amount*3/100;
        uint256 lpAmount = amount*2/100;
        amount = amount - operationalAmount - marketingAmount - lpAmount;
        super.transfer(operationalAddress, operationalAmount);
        super.transfer(marketingAddress, marketingAmount);
        super.transfer(lpAddress, lpAmount);
        super.transfer(recipient, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public virtual override returns (bool) {
        uint256 operationalAmount = amount*3/100;
        uint256 marketingAmount = amount*3/100;
        uint256 lpAmount = amount*2/100;
        amount = amount - operationalAmount - marketingAmount - lpAmount;
        super.transferFrom(sender, operationalAddress, operationalAmount);
        super.transferFrom(sender, marketingAddress, marketingAmount);
        super.transferFrom(sender, lpAddress, lpAmount);
        super.transferFrom(sender, recipient, amount);
        return true;
    }

    function pause() external onlyAdminRole {
        super._pause();
    }

    function unpause() external onlyAdminRole {
        super._unpause();
    }
}
