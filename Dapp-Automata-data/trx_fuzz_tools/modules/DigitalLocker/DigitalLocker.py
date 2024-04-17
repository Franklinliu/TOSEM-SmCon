from web3 import Web3

contract_abi = [{"constant":True,"inputs":[],"name":"LockerStatus","outputs":[{"name":"","type":"string"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"BankAgent","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[{"name":"lockerIdentifier","type":"string"},{"name":"image","type":"string"}],"name":"UploadDocuments","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":False,"inputs":[{"name":"intendedPurpose","type":"string"}],"name":"RequestLockerAccess","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":False,"inputs":[],"name":"AcceptSharingRequest","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":False,"inputs":[],"name":"RejectSharingRequest","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"LockerFriendlyName","outputs":[{"name":"","type":"string"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[],"name":"BeginReviewProcess","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"ExpirationDate","outputs":[{"name":"","type":"string"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[],"name":"ReleaseLockerAccess","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"LockerIdentifier","outputs":[{"name":"","type":"string"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[],"name":"Terminate","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":False,"inputs":[],"name":"RevokeAccessFromThirdParty","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":False,"inputs":[{"name":"rejectionReason","type":"string"}],"name":"RejectApplication","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"Owner","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"CurrentAuthorizedUser","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"ThirdPartyRequestor","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[{"name":"thirdPartyRequestor","type":"address"},{"name":"expirationDate","type":"string"},{"name":"intendedPurpose","type":"string"}],"name":"ShareWithThirdParty","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"RejectionReason","outputs":[{"name":"","type":"string"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"Image","outputs":[{"name":"","type":"string"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"IntendedPurpose","outputs":[{"name":"","type":"string"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"State","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"inputs":[{"name":"lockerFriendlyName","type":"string"},{"name":"bankAgent","type":"address"}],"payable":False,"stateMutability":"nonpayable","type":"constructor"}]

class DIgitalLocker:
    def __init__(self, contract_address, private_key, msg_address):
        self.w3 = Web3(Web3.HTTPProvider(f'HTTP://127.0.0.1:8545'))
        self.contract = self.w3.eth.contract(address=contract_address, abi=contract_abi)
        self.private_key = private_key
        self.msg_address = msg_address


    def LockerStatus(self):
        return self.contract.functions.LockerStatus().call()


    def BankAgent(self):
        return self.contract.functions.BankAgent().call()


    def UploadDocuments(self, lockerIdentifier, image):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.UploadDocuments(lockerIdentifier, image).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def RequestLockerAccess(self, intendedPurpose):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.RequestLockerAccess(intendedPurpose).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def AcceptSharingRequest(self, ):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.AcceptSharingRequest().build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def RejectSharingRequest(self, ):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.RejectSharingRequest().build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def LockerFriendlyName(self):
        return self.contract.functions.LockerFriendlyName().call()


    def BeginReviewProcess(self, ):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.BeginReviewProcess().build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def ExpirationDate(self):
        return self.contract.functions.ExpirationDate().call()


    def ReleaseLockerAccess(self, ):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.ReleaseLockerAccess().build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def LockerIdentifier(self):
        return self.contract.functions.LockerIdentifier().call()


    def Terminate(self, ):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.Terminate().build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def RevokeAccessFromThirdParty(self, ):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.RevokeAccessFromThirdParty().build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def RejectApplication(self, rejectionReason):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.RejectApplication(rejectionReason).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def Owner(self):
        return self.contract.functions.Owner().call()


    def CurrentAuthorizedUser(self):
        return self.contract.functions.CurrentAuthorizedUser().call()


    def ThirdPartyRequestor(self):
        return self.contract.functions.ThirdPartyRequestor().call()


    def ShareWithThirdParty(self, thirdPartyRequestor, expirationDate, intendedPurpose):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.ShareWithThirdParty(thirdPartyRequestor, expirationDate, intendedPurpose).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def RejectionReason(self):
        return self.contract.functions.RejectionReason().call()


    def Image(self):
        return self.contract.functions.Image().call()


    def IntendedPurpose(self):
        return self.contract.functions.IntendedPurpose().call()


    def State(self):
        return self.contract.functions.State().call()
    
"""
msg_address = "0x666474a318918123e27b9d6f1283528C88f97827"
private_key = "5a6ba72f303f14aef83570587c966fcbee07c70b615e9304c127f6ace21c5e38"
contract_address = "0x38c2af432D0Aa8eE1e1ee0A76d5Bb1469b621812"
contract_handler = DIgitalLocker(contract_address,private_key,msg_address)

print("LockerStatus:", contract_handler.LockerStatus())
print("BankAgent:", contract_handler.BankAgent())
print("LockerFriendlyName:", contract_handler.LockerFriendlyName())
print("ExpirationDate:", contract_handler.ExpirationDate())
print("LockerIdentifier:", contract_handler.LockerIdentifier())
print("Owner:", contract_handler.Owner())
print("CurrentAuthorizedUser:", contract_handler.CurrentAuthorizedUser())
print("ThirdPartyRequestor:", contract_handler.ThirdPartyRequestor())
print("RejectionReason:", contract_handler.RejectionReason())
print("Image:", contract_handler.Image())
print("IntendedPurpose:", contract_handler.IntendedPurpose())
print("State:", contract_handler.State())
"""