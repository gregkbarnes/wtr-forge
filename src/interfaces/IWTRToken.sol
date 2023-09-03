// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

interface WTRToken {
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Initialized(uint8 version);
    event Paused(address account);
    event RoleAdminChanged(bytes32 indexed role, bytes32 indexed previousAdminRole, bytes32 indexed newAdminRole);
    event RoleGranted(bytes32 indexed role, address indexed account, address indexed sender);
    event RoleRevoked(bytes32 indexed role, address indexed account, address indexed sender);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Unpaused(address account);

    function DEFAULT_ADMIN_ROLE() external view returns (bytes32);
    function MAX_CAP() external view returns (uint256);
    function MINTER_ROLE() external view returns (bytes32);
    function PAUSER_ROLE() external view returns (bytes32);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
    function burn(uint256 amount) external;
    function burnFrom(address account, uint256 amount) external;
    function decimals() external view returns (uint8);
    function decreaseAllowance(address spender, uint256 subtractedValue) external returns (bool);
    function freeze(address account) external;
    function getRoleAdmin(bytes32 role) external view returns (bytes32);
    function getRoleMember(bytes32 role, uint256 index) external view returns (address);
    function getRoleMemberCount(bytes32 role) external view returns (uint256);
    function grantRole(bytes32 role, address account) external;
    function hasRole(bytes32 role, address account) external view returns (bool);
    function increaseAllowance(address spender, uint256 addedValue) external returns (bool);
    function initialize(string memory name, string memory symbol) external;
    function isAccountFrozen(address) external view returns (bool);
    function mint(address to, uint256 amount) external;
    function name() external view returns (string memory);
    function pause() external;
    function paused() external view returns (bool);
    function renounceRole(bytes32 role, address account) external;
    function revokeRole(bytes32 role, address account) external;
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
    function symbol() external view returns (string memory);
    function totalSupply() external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function unfreeze(address account) external;
    function unpause() external;
}
