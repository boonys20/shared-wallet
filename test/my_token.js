const {
  BN,           // Big Number support
  constants,    // Common constants, like the zero address and largest integers
  expectEvent,  // Assertions for emitted events
  expectRevert, // Assertions for transactions that should fail
} = require('@openzeppelin/test-helpers');

const { expect, should } = require('chai');

const MyToken = artifacts.require("MyToken");

contract('MyToken', function (accounts) {
  
  const [ initialHolder, recipient, anotherAccount ] = accounts;
  const initialSupply = new BN(10000);

  beforeEach(async function () {
    this.value = new BN(100)
    this.token = await MyToken.new(initialSupply);
  });

  it('has a name', async function () {
    expect(await this.token.name()).to.equal("My Test Coin");
  });

  it('has a symbol', async function () {
    expect(await this.token.symbol()).to.equal("MTC");
  });

  it('has 18 decimals', async function () {
    expect(await this.token.decimals()).to.be.bignumber.equal('18');
  });

  
});
