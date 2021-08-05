const SharedWallet = artifacts.require("SharedWallet");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("SharedWallet", function (/* accounts */) {
  it("should assert true", async function () {
    await SharedWallet.deployed();
    return assert.isTrue(true);
  });

});
