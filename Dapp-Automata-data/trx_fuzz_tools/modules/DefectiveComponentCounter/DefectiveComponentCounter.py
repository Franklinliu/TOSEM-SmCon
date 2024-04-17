from web3 import Web3

contract_abi = [{"constant":True,"inputs":[{"name":"","type":"uint256"}],"name":"DefectiveComponentsCount","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[],"name":"ComputeTotal","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"Total","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"Manufacturer","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"State","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"GetDefectiveComponentsCount","outputs":[{"name":"","type":"int256[12]"}],"payable":False,"stateMutability":"view","type":"function"},{"inputs":[{"name":"defectiveComponentsCount","type":"int256[12]"}],"payable":False,"stateMutability":"nonpayable","type":"constructor"}]

class DefectiveComponentCounter:
    def __init__(self, contract_address, private_key, msg_address):
        self.w3 = Web3(Web3.HTTPProvider(f'HTTP://127.0.0.1:8545'))
        self.contract = self.w3.eth.contract(address=contract_address, abi=contract_abi)
        self.private_key = private_key
        self.msg_address = msg_address


    def DefectiveComponentsCount(self):
        return self.contract.functions.DefectiveComponentsCount().call()


    def ComputeTotal(self, ):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.ComputeTotal().build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def Total(self):
        return self.contract.functions.Total().call()


    def Manufacturer(self):
        return self.contract.functions.Manufacturer().call()


    def State(self):
        return self.contract.functions.State().call()


    def GetDefectiveComponentsCount(self):
        return self.contract.functions.GetDefectiveComponentsCount().call()

"""
contract_address = "0x125cBEc58e9B6E894C77391817B41aDaCFa835C8"
private_key = "5a6ba72f303f14aef83570587c966fcbee07c70b615e9304c127f6ace21c5e38"
msg_address = "0x666474a318918123e27b9d6f1283528C88f97827"

contract_handler = DefectiveComponentCounter(contract_address,private_key,msg_address)

#print("DefectiveComponentsCount:", contract_handler.DefectiveComponentsCount())
print("Total:", contract_handler.Total())
print("Manufacturer:", contract_handler.Manufacturer())
print("State:", contract_handler.State())
print("GetDefectiveComponentsCount:", contract_handler.GetDefectiveComponentsCount())
"""