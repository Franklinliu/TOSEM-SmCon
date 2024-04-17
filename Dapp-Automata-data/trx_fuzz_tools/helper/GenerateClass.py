from web3 import Web3

def generate_contract_class(abi):
    class_template = """
class ContractInteraction:
    def __init__(self, contract_address, private_key, msg_address):
        self.w3 = Web3(Web3.HTTPProvider(f'HTTP://127.0.0.1:8545'))
        self.contract = self.w3.eth.contract(address=contract_address, abi=contract_abi)
        self.private_key = private_key
        self.msg_address = msg_address

    %s
"""

    function_methods = []

    for item in abi:
        if item["type"] == "function":
            method_name = item["name"]
            inputs = ", ".join([f"{param['name']}" for param in item["inputs"]])
            outputs = ", ".join([f"{param['name']}" for param in item["outputs"]])

            if item["stateMutability"] == "view":
                function_template = f"""
    def {method_name}(self):
        return self.contract.functions.{method_name}().call()
"""
            else:
                function_template = f"""
    def {method_name}(self, {inputs}):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.{method_name}({inputs}).build_transaction({{
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        }})

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()
"""

            function_methods.append(function_template)

    generated_methods = "\n".join(function_methods)
    class_code = class_template % generated_methods
    return class_code


contract_abi = [{"constant":False,"inputs":[],"name":"Complete","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"ComplianceSensorType","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"MinTemperature","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[{"name":"newCounterparty","type":"address"}],"name":"TransferResponsibility","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"PreviousCounterparty","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"MaxTemperature","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"SupplyChainObserver","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"Counterparty","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"ComplianceDetail","outputs":[{"name":"","type":"string"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"SupplyChainOwner","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"LastSensorUpdateTimestamp","outputs":[{"name":"","type":"uint256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"Device","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[{"name":"humidity","type":"int256"},{"name":"temperature","type":"int256"},{"name":"timestamp","type":"uint256"}],"name":"IngestTelemetry","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"Owner","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"MinHumidity","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"MaxHumidity","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"InitiatingCounterparty","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"ComplianceStatus","outputs":[{"name":"","type":"bool"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"ComplianceSensorReading","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"State","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"inputs":[{"name":"device","type":"address"},{"name":"supplyChainOwner","type":"address"},{"name":"supplyChainObserver","type":"address"},{"name":"minHumidity","type":"int256"},{"name":"maxHumidity","type":"int256"},{"name":"minTemperature","type":"int256"},{"name":"maxTemperature","type":"int256"}],"payable":False,"stateMutability":"nonpayable","type":"constructor"}]
generated_class_code = generate_contract_class(contract_abi)
print(generated_class_code)



