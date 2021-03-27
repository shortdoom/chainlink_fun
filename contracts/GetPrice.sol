pragma solidity 0.7.4;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "./Feeder.sol";

contract PriceConsumerV3 is Feeder {
    AggregatorV3Interface internal priceFeed;

    constructor(address[] memory _tokens, address[] memory _feeds) public Feeder(_tokens, _feeds) {}

    /**
        Mock contract to demonstrate logic of finding right Price Feed for given token.
        You need link tokens to execute this, otherwise it will revert.
     */
    function getLatestPriceForToken(address token) public returns (int256) {
        address feed = getFeedForToken(token);
        priceFeed = AggregatorV3Interface(feed);
        (uint80 roundID, int256 price, uint256 startedAt, uint256 timeStamp, uint80 answeredInRound) =
            priceFeed.latestRoundData();

        // Do something with Price Feed Data

        return(price);
    }
}
