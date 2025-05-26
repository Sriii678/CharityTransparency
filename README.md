# CharityTransparency
CharityTransparency is a blockchain-based smart contract that ensures transparent, accountable, and trustless donation tracking for charitable organizations. It allows donors to contribute funds openly and enables charities to request funds with documented proof of use. All transactions, fund usage, and approvals are permanently recorded on-chain.
# 🤝 CharityTransparency Smart Contract

A transparent and decentralized system for managing charitable donations, built on the Ethereum blockchain.

## 💡 Overview

**CharityTransparency** is a smart contract that ensures all donations and fund disbursements are securely logged and traceable on-chain. It allows donors to give directly and lets charities request funds by providing clear proof of use. Fund disbursement requires admin approval, making it a trust-minimized and auditable process.

---

## 🚀 Features

- ✅ **Transparent Donations**: All donations are publicly visible on-chain.
- 🧾 **Fund Request with Purpose & Proof**: Charities must explain how they will use funds and submit a document or link as proof.
- 🔒 **Admin-Controlled Approvals**: Only the admin can approve disbursement requests.
- 💼 **On-Chain Auditing**: Track every transaction, from donation to fund release.
- 🔗 **EVM Compatible**: Deployable on Ethereum mainnet, testnets, Polygon, BNB Chain, etc.

---

## ⚙️ Contract Details

- **Admin Address**: [`0x5657faef98178b721016bf3d3ac4be6fdccbc1bc`](https://etherscan.io/address/0x5657faef98178b721016bf3d3ac4be6fdccbc1bc)
- **Language**: Solidity `^0.8.24`
- **License**: MIT

---

## 📌 Functions

| Function            | Description |
|---------------------|-------------|
| `donate()`          | Donate ETH to the contract |
| `requestFunds()`    | Charity submits a request with amount, purpose, and proof |
| `approveRequest()`  | Admin approves a charity's fund request |
| `releaseFunds()`    | After approval, charity receives the funds |
| `getDonations()`    | Returns list of all donation records |
| `getBalance()`      | View current contract balance |

---

## 🖼 Use Cases

- NGO or non-profit fundraising
- DAO-managed donation campaigns
- Transparent grant and community fund distribution

---

## 🧪 Deployment & Testing

To deploy locally or on a testnet:

1. Clone the repo
2. Compile with [Remix](https://remix.ethereum.org/) or Hardhat
3. Deploy with your preferred wallet (MetaMask, Hardhat, Foundry)
4. Interact using the contract UI or web frontend

---

## 💖 Support or Donate

If you'd like to support the project or send a test donation,
use this address:0x5657faef98178b721016bf3d3ac4be6fdccbc1bc

![Screenshot 2025-05-26 143625](https://github.com/user-attachments/assets/d750cc49-8ef3-4b8a-8332-328ebbb86a40)


