from web3 import Web3

contract_abi = [{"constant":False,"inputs":[{"name":"miles","type":"int256[]"}],"name":"AddMiles","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"RewardsPerMile","outputs":[{"name":"","type":"uint256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"AirlineRepresentative","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[{"name":"","type":"uint256"}],"name":"Miles","outputs":[{"name":"","type":"uint256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"GetMiles","outputs":[{"name":"","type":"uint256[]"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"Flyer","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"State","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"TotalRewards","outputs":[{"name":"","type":"uint256"}],"payable":False,"stateMutability":"view","type":"function"},{"inputs":[{"name":"flyer","type":"address"},{"name":"rewardsPerMile","type":"int256"}],"payable":False,"stateMutability":"nonpayable","type":"constructor"}]

class FrequentFlyerRewardsCalculator:
    def __init__(self, contract_address, private_key, msg_address):
        self.w3 = Web3(Web3.HTTPProvider(f'HTTP://127.0.0.1:8545'))
        self.contract = self.w3.eth.contract(address=contract_address, abi=contract_abi)
        self.private_key = private_key
        self.msg_address = msg_address


    def AddMiles(self, miles):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.AddMiles(miles).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def RewardsPerMile(self):
        return self.contract.functions.RewardsPerMile().call()


    def AirlineRepresentative(self):
        return self.contract.functions.AirlineRepresentative().call()


    def Miles(self):
        return self.contract.functions.Miles().call()


    def GetMiles(self):
        return self.contract.functions.GetMiles().call()


    def Flyer(self):
        return self.contract.functions.Flyer().call()


    def State(self):
        return self.contract.functions.State().call()


    def TotalRewards(self):
        return self.contract.functions.TotalRewards().call()
    
"""
contract_address = "0x5c6391B373C8E61e030b6E4ca9a62825CfF098b0"
msg_address = "0x666474a318918123e27b9d6f1283528C88f97827"
private_key = "5a6ba72f303f14aef83570587c966fcbee07c70b615e9304c127f6ace21c5e38"
contract_handler = FrequentFlyerRewardsCalculator(contract_address,private_key,msg_address)

print("RewardsPerMile:", contract_handler.RewardsPerMile())
print("AirlineRepresentative:", contract_handler.AirlineRepresentative())
print("GetMiles:", contract_handler.GetMiles())
print("Flyer:", contract_handler.Flyer())
print("State:", contract_handler.State())
print("TotalRewards:", contract_handler.TotalRewards())
"""