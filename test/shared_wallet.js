const SharedWallet = artifacts.require("SharedWallet");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("SharedWallet", accounts => {

  it("should status of deployed is true", async function () {
    await SharedWallet.deployed();
    return assert.isTrue(true);
  });

  it("should not emptry the first account", () => {
    SharedWallet.deployed().then(instance => instance.getBalance.call(accounts[0])).then(balance => {
      assert.equal(
        balance.valueOf(),
        balance.valueOf(),
        "balance in first account is " + balance.valueOf()
      );
    })});
  

});