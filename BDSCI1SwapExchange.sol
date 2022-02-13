// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

import "../interfaces/external/IQuoterV2.sol";
import "../interfaces/external/ISwapRouter.sol";
import "../interfaces/IBrightRiskToken.sol";

contract BDSCI1SwapExchange is OwnableUpgradeable {
    IQuoterV2 public quoter;
    ISwapRouter public router;

    function __BDSCI1SwapExchange_init(address _quoter, address _router) external initializer {
        __Ownable_init();
        quoter = IQuoterV2(_quoter);
        router = ISwapRouter(_router);
    }

    function howManyAinB(
        address _tokenA,
        address _tokenB,
        uint256 _amountB
    ) external returns (uint256 _amountA) {
        IQuoterV2.QuoteExactInputSingleParams memory params = IQuoterV2
            .QuoteExactInputSingleParams(_tokenB, _tokenA, _amountB, 0, 0);
        (_amountA, , , ) = quoter.quoteExactInputSingle(params);
    }

    function swapExactInputSingle(
        address _tokenIn,
        address _tokenOut,
        address _recipient,
        uint256 _amountIn,
        uint256 _amountOutMinimum
    ) external returns (uint256) {
        //TODO transfer from
        //TODO approve router
        ISwapRouter.ExactInputSingleParams memory params = ISwapRouter.ExactInputSingleParams(
            _tokenIn,
            _tokenOut,
            0,
            _recipient,
            _amountIn,
            _amountOutMinimum,
            0
        );
        return router.exactInputSingle(params);
    }
}
