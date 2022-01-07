from solcx import compile_standard,install_solc
import json
from web3 import Web3
with open("SimpleStorage.sol", "r") as file:
    ssReader = file.read()
# compiling the solidity
install_solc('0.6.0')
compiledSol = compile_standard({
    "language": "Solidity",
    "sources": {"SimpleStorage.sol": {"content": ssReader}},
    "settings": {
        "outputSelection": {
            "*": {"*": ["abi", "matadata", "evm.bytecode", "evml.sourceMap"]}
        }
    }

}, solc_version="0.6.0")

with open("compiledCode.Json","w") as file:
    json.dump(compiledSol, file)

bytecode = compiledSol["contracts"]["SimpleStorage.sol"]["simpleStorage"]["evm"]["bytecode"]["object"]

abi = compiledSol["contracts"]["SimpleStorage.sol"]["simpleStorage"]["abi"]

# ganache --> Fake Blockchain
# for connecting to ganache

w3 = Web3(Web3.HTTPProvider("HTTP://127.0.0.1:7545"))
chainId  = 1337
address = "0xbC4ff096062E42F013B5e03835d525D43ab08b10"
privateKey = "1464706b5f439cc0f97857262b15ee1aa45776dd4d73c5cbb00b9a91966add9d"

# deploy on ganache

SimpleStorage = w3.eth.contract(abi=abi,bytecode=bytecode)
# get latest transation
nonce = w3.eth.getTransactionCount(address)
print(nonce)


# 1. Build a transction
# 2. sign a transaction
# 3. send a transation
transaction = SimpleStorage.constructor().buildTransaction({"chainId":chainId, "from":address, "nonce":nonce})
print(transaction)yjmuyjumju76u6u7uj7ju7ju7u7j7j7ju