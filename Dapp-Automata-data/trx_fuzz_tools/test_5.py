from modules.DigitalLocker.DigitalLocker  import DIgitalLocker
from map import load_account_data_from_json
from modules.random.data_generate import *

address_to_private_key, private_key_to_address = load_account_data_from_json("account.json")

with open("deployer/5DigitalLocker.txt", "r") as file:
    data_list = [line.strip() for line in file]

test_flag = True
op_num = 0

for i in data_list:
    req1 = DIgitalLocker(i,address_to_private_key["0x3F8306Adf9DDa2E06Fd068CA44220756d9FDeF65"],"0x3F8306Adf9DDa2E06Fd068CA44220756d9FDeF65")
    if test_flag:
        while op_num != 100:
            r_number = generate_random_number(0,9)
            if r_number == 0:
                req1.Terminate()
                op_num +=1
            elif r_number == 1:
                req1.RevokeAccessFromThirdParty()
                op_num +=1
            elif r_number == 2:
                req1.RejectSharingRequest()
                op_num +=1
            elif r_number == 3:
                req1.AcceptSharingRequest()
                op_num +=1
            elif r_number == 4:
                bank_address = req1.BankAgent()
                req2 = DIgitalLocker(i,address_to_private_key[bank_address],bank_address)
                req2.UploadDocuments(generate_random_string(generate_random_number(1,10)),generate_random_string(generate_random_number(1,10)))
                op_num += 1
            elif r_number == 5:
                bank_address = req1.BankAgent()
                req2 = DIgitalLocker(i,address_to_private_key[bank_address],bank_address)
                req2.RejectApplication(generate_random_string(generate_random_number(1,10)))
                op_num += 1
            elif r_number == 6:
                random_address = random.choice(list(address_to_private_key.keys()))
                while random_address == req1.Owner():
                    random_address = random.choice(list(address_to_private_key.keys()))
                req2 = DIgitalLocker(i,address_to_private_key[random_address],random_address)
                req2.BeginReviewProcess()
                op_num += 1
            elif r_number == 7:
                release = req1.CurrentAuthorizedUser()
                if release == "0x0000000000000000000000000000000000000000":
                    continue
                else:
                    req2 = DIgitalLocker(i,address_to_private_key[release],release)
                    req2.ReleaseLockerAccess()
                    op_num += 1
            elif r_number == 8:
                random_address = random.choice(list(address_to_private_key.keys()))
                while random_address == req1.Owner():
                    random_address = random.choice(list(address_to_private_key.keys()))
                req2 = DIgitalLocker(i,address_to_private_key[random_address],random_address)
                req2.RequestLockerAccess(generate_random_string(generate_random_number(1,10)))
                op_num += 1
            else:
                random_address = random.choice(list(address_to_private_key.keys()))
                while random_address == req1.Owner():
                    random_address = random.choice(list(address_to_private_key.keys()))
                req1.ShareWithThirdParty(random_address,generate_random_string(generate_random_number(1,10)),generate_random_string(generate_random_number(1,10)))
                op_num += 1
            
        op_num = 0
        print(i)
    else:
        print(req1.State())