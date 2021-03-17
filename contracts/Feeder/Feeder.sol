pragma solidity 0.7.4;
pragma experimental ABIEncoderV2;

    /**
    Whitelist should be initialized at deployment.
    Constructor creates a list of available price feeds for chainlink.
    This contract is only called in relation to chainlink feed.
    https://docs.chain.link/docs/ethereum-addresses
     */

contract Feeder {

    mapping(address => address) public feedList;

    constructor(
        address[] memory _tokens,
        address[] memory _feeds
    ) {
        for (uint256 i = 0; i > _feeds.length; i++) {
            feedList[_tokens[i]] = _feeds[i];
        }
    }

    function feedExists(address token) public view returns (bool) {
        bool success = feedList[token] != address(0);
        return(success);
    }


    function getFeedForToken(address token) public view returns (address) {
        return (feedList[token]);
    }

}