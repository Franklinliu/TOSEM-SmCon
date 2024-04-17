from web3 import Web3

contract_abi = [{"constant":False,"inputs":[],"name":"Complete","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":False,"inputs":[{"name":"newCounterparty","type":"address"}],"name":"TransferResponsibility","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"PreviousCounterparty","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"SupplyChainObserver","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"Counterparty","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"SupplyChainOwner","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"InitiatingCounterparty","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"State","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"inputs":[{"name":"supplyChainOwner","type":"address"},{"name":"supplyChainObserver","type":"address"}],"payable":False,"stateMutability":"nonpayable","type":"constructor"}]

class BasicProvenance:
    def __init__(self, contract_address,private_key,msg_address):
        self.w3 = Web3(Web3.HTTPProvider(f'HTTP://127.0.0.1:8545'))
        self.contract = self.w3.eth.contract(address=contract_address, abi=contract_abi)
        self.private_key = private_key
        self.msg_address = msg_address

    def get_state(self):
        return self.contract.functions.State().call()
    
    def get_initiating_counterparty(self):
        return self.contract.functions.InitiatingCounterparty().call()

    def get_counterparty(self):
        return self.contract.functions.Counterparty().call()

    def get_previous_counterparty(self):
        return self.contract.functions.PreviousCounterparty().call()

    def get_supply_chain_owner(self):
        return self.contract.functions.SupplyChainOwner().call()

    def get_supply_chain_observer(self):
        return self.contract.functions.SupplyChainObserver().call()
    
    def TransferResponsibility(self,new_counterparty):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.TransferResponsibility(new_counterparty).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()
    
    def Complete(self):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.Complete().build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()

"""
contract_address = "0x7ad8d092734056EAA42e54471BF7b1b089F85E4e"
private_key = "60af3745555ca934c42a050637743314ca8ba1de36bf66e846c563427b625749"
msg_address = "0x0167a993B82feF5033645b2Bc345325646B3FDEd"
contract_handler = BasicProvenance(contract_address,private_key,msg_address)

print(contract_handler.get_supply_chain_owner())
"""