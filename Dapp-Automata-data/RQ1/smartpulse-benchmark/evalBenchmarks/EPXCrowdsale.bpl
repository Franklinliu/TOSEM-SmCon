// FALSE PROPERTY
// LTLProperty: [](finished(EPXCrowdsale.buy))

// Spec L1 <--- WORKS
// LTLVariables: user:Ref
// LTLFairness: <>(finished(EPXCrowdsale.refund, msg.sender == user))
// LTLProperty: <>(finished(send(from, to, amt), to == user && amt == fsum(EPXCrowdsale.buy, 2, msg.sender == user)))

// Spec L1 (v2) <--- DOESN'T WORK (block.number modelling is too general)
// LTLVariables: user:Ref
// LTLFairness: <>(finished(EPXCrowdsale.buy, msg.sender == user) ; started(EPXCrowdsale.refund, this.isCrowdSaleClosed == true && this.amountRaisedInWei < this.fundingMinCapInWei && this.CurrentStatus == -2023790500 && this.usersEPXfundValue[msg.sender] > 0 && msg.sender == user))
// LTLProperty: <>(finished(send(from, to, amt), to == user && amt == fsum(EPXCrowdsale.buy, 2, msg.sender == user)))

// Spec L2 <--- WORKS (also <>finished(*, fsum1 < fsum2)), yields a cex (not sure if guniene))
// LTLVariables: ben:Ref
// LTLFairness: [](started(*, this.areFundsReleasedToBeneficiary == true) ==> <>(finished(EPXCrowdsale.beneficiaryMultiSigWithdraw(amt), amt == old(Balance[this]) && ben == beneficiaryWallet_EPXCrowdsale[this]))) && <>(finished(*, this.areFundsReleasedToBeneficiary == true))
// LTLProperty: <>(finished(*, (this.areFundsReleasedToBeneficiary == true && fsum(EPXCrowdsale.buy, 2) == fsum(send(from, to, amt), 2, to == ben))))

// Spec L2 (v2) (alternate fairness prop) <--- TO at 30 min
// LTLFairness: <>(finished(EPXCrowdsale.beneficiaryMultiSigWithdraw(amt), amt == this.amountRaisedInWei))

// Spec L2 (v3) <--- WORKS
// LTLFairness: <>(finished(EPXCrowdsale.beneficiaryMultiSigWithdraw(amt), amt == fsum(EPXCrowdsale.buy, 2)))
// LTLProperty: <>(finished(send(from, to, amt), to == beneficiaryWallet_EPXCrowdsale[from] && amt == fsum(EPXCrowdsale.buy, 2))) 

// Spec L2 (v4) <--- Interesting Counterexample (apparently you can buy again after a beneficiary withdrawal?)
// LTLFairness: <>(finished(*, fsum(EPXCrowdsale.beneficiaryMultiSigWithdraw, 3) == fsum(EPXCrowdsale.buy, 2) && this.amountRaisedInWei > 0))
// LTLProperty: <>([](!finished(*, fsum(send(from, to, amt), 2, to == beneficiaryWallet_EPXCrowdsale[from]) != fsum(EPXCrowdsale.buy, 2))))

type Ref = int;
type ContractName = int;
var null: Ref;
var owned: ContractName;
var safeMath: ContractName;
var StandardToken: ContractName;
var EPXCrowdsale: ContractName;
function {:smtdefined "x"} ConstantToRef(x: int) returns (ret: Ref);
function BoogieRefToInt(x: Ref) returns (ret: int);
function {:bvbuiltin "mod"} modBpl(x: int, y: int) returns (ret: int);
function keccak256(x: int) returns (ret: int);
function abiEncodePacked1(x: int) returns (ret: int);
function _SumMapping_VeriSol(x: [Ref]int) returns (ret: int);
function abiEncodePacked2(x: int, y: int) returns (ret: int);
function abiEncodePacked1R(x: Ref) returns (ret: int);
function abiEncodePacked2R(x: Ref, y: int) returns (ret: int);
function {:smtdefined "((as const (Array Int Int)) 0)"} zeroRefIntArr() returns (ret: [Ref]int);
function {:smtdefined "((as const (Array Int Int)) 0)"} zeroIntIntArr() returns (ret: [int]int);
function {:smtdefined "((as const (Array Int Bool)) false)"} zeroRefBoolArr() returns (ret: [Ref]bool);
function {:smtdefined "((as const (Array Int Bool)) false)"} zeroIntBoolArr() returns (ret: [int]bool);
function {:smtdefined "((as const (Array Int Int)) 0)"} zeroRefRefArr() returns (ret: [Ref]Ref);
function {:smtdefined "((as const (Array Int Int)) 0)"} zeroIntRefArr() returns (ret: [int]Ref);
var Balance: [Ref]int;
var DType: [Ref]ContractName;
var Alloc: [Ref]bool;
var balance_ADDR: [Ref]int;
var M_Ref_int: [Ref][Ref]int;
var sum: [Ref]int;
var Length: [Ref]int;
var revert: bool;
var gas: int;
var now: int;
procedure {:inline 1} FreshRefGenerator__success() returns (newRef: Ref);
modifies Alloc;
var {:access "this.owner=owner_owned[this]"} owner_owned: [Ref]Ref;
procedure {:inline 1} owned_owned_NoBaseCtor__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies owner_owned;
procedure {:constructor} {:public} {:inline 1} owned_owned(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies __tmp__Balance;
modifies __tmp__DType;
modifies __tmp__Alloc;
modifies __tmp__balance_ADDR;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__Length;
modifies __tmp__now;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
modifies Balance;
modifies owner_owned;
implementation owned_owned(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __exception: bool;
havoc __exception;
revert := false;
if (__exception) {
__tmp__Balance := Balance;
__tmp__DType := DType;
__tmp__Alloc := Alloc;
__tmp__balance_ADDR := balance_ADDR;
__tmp__M_Ref_int := M_Ref_int;
__tmp__sum := sum;
__tmp__Length := Length;
__tmp__now := now;
__tmp__owner_owned := owner_owned;
__tmp__admin_EPXCrowdsale := admin_EPXCrowdsale;
__tmp__tokenReward_EPXCrowdsale := tokenReward_EPXCrowdsale;
__tmp__initialTokenSupply_EPXCrowdsale := initialTokenSupply_EPXCrowdsale;
__tmp__tokensRemaining_EPXCrowdsale := tokensRemaining_EPXCrowdsale;
__tmp__beneficiaryWallet_EPXCrowdsale := beneficiaryWallet_EPXCrowdsale;
__tmp__amountRaisedInWei_EPXCrowdsale := amountRaisedInWei_EPXCrowdsale;
__tmp__fundingMinCapInWei_EPXCrowdsale := fundingMinCapInWei_EPXCrowdsale;
__tmp__CurrentStatus_EPXCrowdsale := CurrentStatus_EPXCrowdsale;
__tmp__fundingStartBlock_EPXCrowdsale := fundingStartBlock_EPXCrowdsale;
__tmp__fundingEndBlock_EPXCrowdsale := fundingEndBlock_EPXCrowdsale;
__tmp__isCrowdSaleClosed_EPXCrowdsale := isCrowdSaleClosed_EPXCrowdsale;
__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale := areFundsReleasedToBeneficiary_EPXCrowdsale;
__tmp__isCrowdSaleSetup_EPXCrowdsale := isCrowdSaleSetup_EPXCrowdsale;
__tmp__balancesArray_EPXCrowdsale := balancesArray_EPXCrowdsale;
__tmp__usersEPXfundValue_EPXCrowdsale := usersEPXfundValue_EPXCrowdsale;
call owned_owned__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) || ((gas) < (0)));
} else {
call owned_owned__success(this, msgsender_MSG, msgvalue_MSG);
assume ((!(revert)) && ((gas) >= (0)));
}
}

procedure {:inline 1} safeMath_safeMath_NoBaseCtor__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
procedure {:inline 1} safeMath_safeMath(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies __tmp__Balance;
modifies __tmp__DType;
modifies __tmp__Alloc;
modifies __tmp__balance_ADDR;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__Length;
modifies __tmp__now;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
modifies Balance;
implementation safeMath_safeMath(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __exception: bool;
havoc __exception;
revert := false;
if (__exception) {
__tmp__Balance := Balance;
__tmp__DType := DType;
__tmp__Alloc := Alloc;
__tmp__balance_ADDR := balance_ADDR;
__tmp__M_Ref_int := M_Ref_int;
__tmp__sum := sum;
__tmp__Length := Length;
__tmp__now := now;
__tmp__owner_owned := owner_owned;
__tmp__admin_EPXCrowdsale := admin_EPXCrowdsale;
__tmp__tokenReward_EPXCrowdsale := tokenReward_EPXCrowdsale;
__tmp__initialTokenSupply_EPXCrowdsale := initialTokenSupply_EPXCrowdsale;
__tmp__tokensRemaining_EPXCrowdsale := tokensRemaining_EPXCrowdsale;
__tmp__beneficiaryWallet_EPXCrowdsale := beneficiaryWallet_EPXCrowdsale;
__tmp__amountRaisedInWei_EPXCrowdsale := amountRaisedInWei_EPXCrowdsale;
__tmp__fundingMinCapInWei_EPXCrowdsale := fundingMinCapInWei_EPXCrowdsale;
__tmp__CurrentStatus_EPXCrowdsale := CurrentStatus_EPXCrowdsale;
__tmp__fundingStartBlock_EPXCrowdsale := fundingStartBlock_EPXCrowdsale;
__tmp__fundingEndBlock_EPXCrowdsale := fundingEndBlock_EPXCrowdsale;
__tmp__isCrowdSaleClosed_EPXCrowdsale := isCrowdSaleClosed_EPXCrowdsale;
__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale := areFundsReleasedToBeneficiary_EPXCrowdsale;
__tmp__isCrowdSaleSetup_EPXCrowdsale := isCrowdSaleSetup_EPXCrowdsale;
__tmp__balancesArray_EPXCrowdsale := balancesArray_EPXCrowdsale;
__tmp__usersEPXfundValue_EPXCrowdsale := usersEPXfundValue_EPXCrowdsale;
call safeMath_safeMath__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) || ((gas) < (0)));
} else {
call safeMath_safeMath__success(this, msgsender_MSG, msgvalue_MSG);
assume ((!(revert)) && ((gas) >= (0)));
}
}

procedure {:inline 1} safeMul_safeMath__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s54: int, b_s54: int) returns (__ret_0_: int);
modifies revert;
procedure {:inline 1} safeDiv_safeMath__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s90: int, b_s90: int) returns (__ret_0_: int);
modifies revert;
procedure {:inline 1} safeSub_safeMath__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s110: int, b_s110: int) returns (__ret_0_: int);
modifies revert;
procedure {:inline 1} safeAdd_safeMath__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s138: int, b_s138: int) returns (__ret_0_: int);
modifies revert;
procedure {:inline 1} safeAssert_safeMath__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, assertion_s150: bool);
modifies revert;
procedure {:inline 1} StandardToken_StandardToken_NoBaseCtor__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
procedure {:inline 1} StandardToken_StandardToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies __tmp__Balance;
modifies __tmp__DType;
modifies __tmp__Alloc;
modifies __tmp__balance_ADDR;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__Length;
modifies __tmp__now;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
modifies Balance;
modifies owner_owned;
implementation StandardToken_StandardToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __exception: bool;
havoc __exception;
revert := false;
if (__exception) {
__tmp__Balance := Balance;
__tmp__DType := DType;
__tmp__Alloc := Alloc;
__tmp__balance_ADDR := balance_ADDR;
__tmp__M_Ref_int := M_Ref_int;
__tmp__sum := sum;
__tmp__Length := Length;
__tmp__now := now;
__tmp__owner_owned := owner_owned;
__tmp__admin_EPXCrowdsale := admin_EPXCrowdsale;
__tmp__tokenReward_EPXCrowdsale := tokenReward_EPXCrowdsale;
__tmp__initialTokenSupply_EPXCrowdsale := initialTokenSupply_EPXCrowdsale;
__tmp__tokensRemaining_EPXCrowdsale := tokensRemaining_EPXCrowdsale;
__tmp__beneficiaryWallet_EPXCrowdsale := beneficiaryWallet_EPXCrowdsale;
__tmp__amountRaisedInWei_EPXCrowdsale := amountRaisedInWei_EPXCrowdsale;
__tmp__fundingMinCapInWei_EPXCrowdsale := fundingMinCapInWei_EPXCrowdsale;
__tmp__CurrentStatus_EPXCrowdsale := CurrentStatus_EPXCrowdsale;
__tmp__fundingStartBlock_EPXCrowdsale := fundingStartBlock_EPXCrowdsale;
__tmp__fundingEndBlock_EPXCrowdsale := fundingEndBlock_EPXCrowdsale;
__tmp__isCrowdSaleClosed_EPXCrowdsale := isCrowdSaleClosed_EPXCrowdsale;
__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale := areFundsReleasedToBeneficiary_EPXCrowdsale;
__tmp__isCrowdSaleSetup_EPXCrowdsale := isCrowdSaleSetup_EPXCrowdsale;
__tmp__balancesArray_EPXCrowdsale := balancesArray_EPXCrowdsale;
__tmp__usersEPXfundValue_EPXCrowdsale := usersEPXfundValue_EPXCrowdsale;
call StandardToken_StandardToken__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) || ((gas) < (0)));
} else {
call StandardToken_StandardToken__success(this, msgsender_MSG, msgvalue_MSG);
assume ((!(revert)) && ((gas) >= (0)));
}
}

procedure {:public} {:inline 1} balanceOf_StandardToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, who_s162: Ref) returns (__ret_0_: int);
procedure {:public} {:inline 1} transfer_StandardToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, to_s171: Ref, value_s171: int) returns (__ret_0_: bool);
var {:access "this.admin=admin_EPXCrowdsale[this]"} admin_EPXCrowdsale: [Ref]Ref;
var {:access "this.tokenReward=tokenReward_EPXCrowdsale[this]"} tokenReward_EPXCrowdsale: [Ref]Ref;
var {:access "this.initialTokenSupply=initialTokenSupply_EPXCrowdsale[this]"} initialTokenSupply_EPXCrowdsale: [Ref]int;
var {:access "this.tokensRemaining=tokensRemaining_EPXCrowdsale[this]"} tokensRemaining_EPXCrowdsale: [Ref]int;
var {:access "this.beneficiaryWallet=beneficiaryWallet_EPXCrowdsale[this]"} beneficiaryWallet_EPXCrowdsale: [Ref]Ref;
var {:access "this.amountRaisedInWei=amountRaisedInWei_EPXCrowdsale[this]"} amountRaisedInWei_EPXCrowdsale: [Ref]int;
var {:access "this.fundingMinCapInWei=fundingMinCapInWei_EPXCrowdsale[this]"} fundingMinCapInWei_EPXCrowdsale: [Ref]int;
var {:access "this.CurrentStatus=CurrentStatus_EPXCrowdsale[this]"} CurrentStatus_EPXCrowdsale: [Ref]int;
var {:access "this.fundingStartBlock=fundingStartBlock_EPXCrowdsale[this]"} fundingStartBlock_EPXCrowdsale: [Ref]int;
var {:access "this.fundingEndBlock=fundingEndBlock_EPXCrowdsale[this]"} fundingEndBlock_EPXCrowdsale: [Ref]int;
var {:access "this.isCrowdSaleClosed=isCrowdSaleClosed_EPXCrowdsale[this]"} isCrowdSaleClosed_EPXCrowdsale: [Ref]bool;
var {:access "this.areFundsReleasedToBeneficiary=areFundsReleasedToBeneficiary_EPXCrowdsale[this]"} areFundsReleasedToBeneficiary_EPXCrowdsale: [Ref]bool;
var {:access "this.isCrowdSaleSetup=isCrowdSaleSetup_EPXCrowdsale[this]"} isCrowdSaleSetup_EPXCrowdsale: [Ref]bool;
var {:access "this.balancesArray[i0]=M_Ref_int[balancesArray_EPXCrowdsale[this]][i0]"} {:sum "sum(this.balancesArray)=sum[balancesArray_EPXCrowdsale[this]]"} balancesArray_EPXCrowdsale: [Ref]Ref;
var {:access "this.usersEPXfundValue[i0]=M_Ref_int[usersEPXfundValue_EPXCrowdsale[this]][i0]"} {:sum "sum(this.usersEPXfundValue)=sum[usersEPXfundValue_EPXCrowdsale[this]]"} usersEPXfundValue_EPXCrowdsale: [Ref]Ref;
procedure {:inline 1} EPXCrowdsale_EPXCrowdsale_NoBaseCtor__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies admin_EPXCrowdsale;
modifies initialTokenSupply_EPXCrowdsale;
modifies tokensRemaining_EPXCrowdsale;
modifies beneficiaryWallet_EPXCrowdsale;
modifies amountRaisedInWei_EPXCrowdsale;
modifies fundingMinCapInWei_EPXCrowdsale;
modifies CurrentStatus_EPXCrowdsale;
modifies fundingStartBlock_EPXCrowdsale;
modifies fundingEndBlock_EPXCrowdsale;
modifies isCrowdSaleClosed_EPXCrowdsale;
modifies areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies isCrowdSaleSetup_EPXCrowdsale;
modifies balancesArray_EPXCrowdsale;
modifies M_Ref_int;
modifies sum;
modifies usersEPXfundValue_EPXCrowdsale;
modifies Alloc;
modifies revert;
procedure {:constructor} {:public} {:inline 1} EPXCrowdsale_EPXCrowdsale(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies __tmp__Balance;
modifies __tmp__DType;
modifies __tmp__Alloc;
modifies __tmp__balance_ADDR;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__Length;
modifies __tmp__now;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
modifies Balance;
modifies owner_owned;
modifies admin_EPXCrowdsale;
modifies initialTokenSupply_EPXCrowdsale;
modifies tokensRemaining_EPXCrowdsale;
modifies beneficiaryWallet_EPXCrowdsale;
modifies amountRaisedInWei_EPXCrowdsale;
modifies fundingMinCapInWei_EPXCrowdsale;
modifies CurrentStatus_EPXCrowdsale;
modifies fundingStartBlock_EPXCrowdsale;
modifies fundingEndBlock_EPXCrowdsale;
modifies isCrowdSaleClosed_EPXCrowdsale;
modifies areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies isCrowdSaleSetup_EPXCrowdsale;
modifies balancesArray_EPXCrowdsale;
modifies M_Ref_int;
modifies sum;
modifies usersEPXfundValue_EPXCrowdsale;
modifies Alloc;
implementation EPXCrowdsale_EPXCrowdsale(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __exception: bool;
havoc __exception;
revert := false;
if (__exception) {
__tmp__Balance := Balance;
__tmp__DType := DType;
__tmp__Alloc := Alloc;
__tmp__balance_ADDR := balance_ADDR;
__tmp__M_Ref_int := M_Ref_int;
__tmp__sum := sum;
__tmp__Length := Length;
__tmp__now := now;
__tmp__owner_owned := owner_owned;
__tmp__admin_EPXCrowdsale := admin_EPXCrowdsale;
__tmp__tokenReward_EPXCrowdsale := tokenReward_EPXCrowdsale;
__tmp__initialTokenSupply_EPXCrowdsale := initialTokenSupply_EPXCrowdsale;
__tmp__tokensRemaining_EPXCrowdsale := tokensRemaining_EPXCrowdsale;
__tmp__beneficiaryWallet_EPXCrowdsale := beneficiaryWallet_EPXCrowdsale;
__tmp__amountRaisedInWei_EPXCrowdsale := amountRaisedInWei_EPXCrowdsale;
__tmp__fundingMinCapInWei_EPXCrowdsale := fundingMinCapInWei_EPXCrowdsale;
__tmp__CurrentStatus_EPXCrowdsale := CurrentStatus_EPXCrowdsale;
__tmp__fundingStartBlock_EPXCrowdsale := fundingStartBlock_EPXCrowdsale;
__tmp__fundingEndBlock_EPXCrowdsale := fundingEndBlock_EPXCrowdsale;
__tmp__isCrowdSaleClosed_EPXCrowdsale := isCrowdSaleClosed_EPXCrowdsale;
__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale := areFundsReleasedToBeneficiary_EPXCrowdsale;
__tmp__isCrowdSaleSetup_EPXCrowdsale := isCrowdSaleSetup_EPXCrowdsale;
__tmp__balancesArray_EPXCrowdsale := balancesArray_EPXCrowdsale;
__tmp__usersEPXfundValue_EPXCrowdsale := usersEPXfundValue_EPXCrowdsale;
call EPXCrowdsale_EPXCrowdsale__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) || ((gas) < (0)));
} else {
call EPXCrowdsale_EPXCrowdsale__success(this, msgsender_MSG, msgvalue_MSG);
assume ((!(revert)) && ((gas) >= (0)));
}
}

procedure {:public} {:inline 1} initialEPXSupply_EPXCrowdsale(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (initialEPXtokenCount_s286: int);
modifies revert;
modifies __tmp__Balance;
modifies __tmp__DType;
modifies __tmp__Alloc;
modifies __tmp__balance_ADDR;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__Length;
modifies __tmp__now;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
implementation initialEPXSupply_EPXCrowdsale(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (initialEPXtokenCount_s286: int)
{
var __exception: bool;
havoc __exception;
revert := false;
if (__exception) {
__tmp__Balance := Balance;
__tmp__DType := DType;
__tmp__Alloc := Alloc;
__tmp__balance_ADDR := balance_ADDR;
__tmp__M_Ref_int := M_Ref_int;
__tmp__sum := sum;
__tmp__Length := Length;
__tmp__now := now;
__tmp__owner_owned := owner_owned;
__tmp__admin_EPXCrowdsale := admin_EPXCrowdsale;
__tmp__tokenReward_EPXCrowdsale := tokenReward_EPXCrowdsale;
__tmp__initialTokenSupply_EPXCrowdsale := initialTokenSupply_EPXCrowdsale;
__tmp__tokensRemaining_EPXCrowdsale := tokensRemaining_EPXCrowdsale;
__tmp__beneficiaryWallet_EPXCrowdsale := beneficiaryWallet_EPXCrowdsale;
__tmp__amountRaisedInWei_EPXCrowdsale := amountRaisedInWei_EPXCrowdsale;
__tmp__fundingMinCapInWei_EPXCrowdsale := fundingMinCapInWei_EPXCrowdsale;
__tmp__CurrentStatus_EPXCrowdsale := CurrentStatus_EPXCrowdsale;
__tmp__fundingStartBlock_EPXCrowdsale := fundingStartBlock_EPXCrowdsale;
__tmp__fundingEndBlock_EPXCrowdsale := fundingEndBlock_EPXCrowdsale;
__tmp__isCrowdSaleClosed_EPXCrowdsale := isCrowdSaleClosed_EPXCrowdsale;
__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale := areFundsReleasedToBeneficiary_EPXCrowdsale;
__tmp__isCrowdSaleSetup_EPXCrowdsale := isCrowdSaleSetup_EPXCrowdsale;
__tmp__balancesArray_EPXCrowdsale := balancesArray_EPXCrowdsale;
__tmp__usersEPXfundValue_EPXCrowdsale := usersEPXfundValue_EPXCrowdsale;
call initialEPXtokenCount_s286 := initialEPXSupply_EPXCrowdsale__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) || ((gas) < (0)));
} else {
call initialEPXtokenCount_s286 := initialEPXSupply_EPXCrowdsale__success(this, msgsender_MSG, msgvalue_MSG);
assume ((!(revert)) && ((gas) >= (0)));
}
}

procedure {:public} {:inline 1} remainingEPXSupply_EPXCrowdsale(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (remainingEPXtokenCount_s299: int);
modifies revert;
modifies __tmp__Balance;
modifies __tmp__DType;
modifies __tmp__Alloc;
modifies __tmp__balance_ADDR;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__Length;
modifies __tmp__now;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
implementation remainingEPXSupply_EPXCrowdsale(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (remainingEPXtokenCount_s299: int)
{
var __exception: bool;
havoc __exception;
revert := false;
if (__exception) {
__tmp__Balance := Balance;
__tmp__DType := DType;
__tmp__Alloc := Alloc;
__tmp__balance_ADDR := balance_ADDR;
__tmp__M_Ref_int := M_Ref_int;
__tmp__sum := sum;
__tmp__Length := Length;
__tmp__now := now;
__tmp__owner_owned := owner_owned;
__tmp__admin_EPXCrowdsale := admin_EPXCrowdsale;
__tmp__tokenReward_EPXCrowdsale := tokenReward_EPXCrowdsale;
__tmp__initialTokenSupply_EPXCrowdsale := initialTokenSupply_EPXCrowdsale;
__tmp__tokensRemaining_EPXCrowdsale := tokensRemaining_EPXCrowdsale;
__tmp__beneficiaryWallet_EPXCrowdsale := beneficiaryWallet_EPXCrowdsale;
__tmp__amountRaisedInWei_EPXCrowdsale := amountRaisedInWei_EPXCrowdsale;
__tmp__fundingMinCapInWei_EPXCrowdsale := fundingMinCapInWei_EPXCrowdsale;
__tmp__CurrentStatus_EPXCrowdsale := CurrentStatus_EPXCrowdsale;
__tmp__fundingStartBlock_EPXCrowdsale := fundingStartBlock_EPXCrowdsale;
__tmp__fundingEndBlock_EPXCrowdsale := fundingEndBlock_EPXCrowdsale;
__tmp__isCrowdSaleClosed_EPXCrowdsale := isCrowdSaleClosed_EPXCrowdsale;
__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale := areFundsReleasedToBeneficiary_EPXCrowdsale;
__tmp__isCrowdSaleSetup_EPXCrowdsale := isCrowdSaleSetup_EPXCrowdsale;
__tmp__balancesArray_EPXCrowdsale := balancesArray_EPXCrowdsale;
__tmp__usersEPXfundValue_EPXCrowdsale := usersEPXfundValue_EPXCrowdsale;
call remainingEPXtokenCount_s299 := remainingEPXSupply_EPXCrowdsale__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) || ((gas) < (0)));
} else {
call remainingEPXtokenCount_s299 := remainingEPXSupply_EPXCrowdsale__success(this, msgsender_MSG, msgvalue_MSG);
assume ((!(revert)) && ((gas) >= (0)));
}
}

procedure {:public} {:inline 1} SetupCrowdsale_EPXCrowdsale(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _fundingStartBlock_s391: int, _fundingEndBlock_s391: int) returns (response_s391: int);
modifies revert;
modifies __tmp__Balance;
modifies __tmp__DType;
modifies __tmp__Alloc;
modifies __tmp__balance_ADDR;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__Length;
modifies __tmp__now;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
modifies beneficiaryWallet_EPXCrowdsale;
modifies tokenReward_EPXCrowdsale;
modifies fundingMinCapInWei_EPXCrowdsale;
modifies amountRaisedInWei_EPXCrowdsale;
modifies initialTokenSupply_EPXCrowdsale;
modifies tokensRemaining_EPXCrowdsale;
modifies fundingStartBlock_EPXCrowdsale;
modifies fundingEndBlock_EPXCrowdsale;
modifies isCrowdSaleSetup_EPXCrowdsale;
modifies isCrowdSaleClosed_EPXCrowdsale;
modifies CurrentStatus_EPXCrowdsale;
implementation SetupCrowdsale_EPXCrowdsale(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _fundingStartBlock_s391: int, _fundingEndBlock_s391: int) returns (response_s391: int)
{
var __exception: bool;
havoc __exception;
revert := false;
if (__exception) {
__tmp__Balance := Balance;
__tmp__DType := DType;
__tmp__Alloc := Alloc;
__tmp__balance_ADDR := balance_ADDR;
__tmp__M_Ref_int := M_Ref_int;
__tmp__sum := sum;
__tmp__Length := Length;
__tmp__now := now;
__tmp__owner_owned := owner_owned;
__tmp__admin_EPXCrowdsale := admin_EPXCrowdsale;
__tmp__tokenReward_EPXCrowdsale := tokenReward_EPXCrowdsale;
__tmp__initialTokenSupply_EPXCrowdsale := initialTokenSupply_EPXCrowdsale;
__tmp__tokensRemaining_EPXCrowdsale := tokensRemaining_EPXCrowdsale;
__tmp__beneficiaryWallet_EPXCrowdsale := beneficiaryWallet_EPXCrowdsale;
__tmp__amountRaisedInWei_EPXCrowdsale := amountRaisedInWei_EPXCrowdsale;
__tmp__fundingMinCapInWei_EPXCrowdsale := fundingMinCapInWei_EPXCrowdsale;
__tmp__CurrentStatus_EPXCrowdsale := CurrentStatus_EPXCrowdsale;
__tmp__fundingStartBlock_EPXCrowdsale := fundingStartBlock_EPXCrowdsale;
__tmp__fundingEndBlock_EPXCrowdsale := fundingEndBlock_EPXCrowdsale;
__tmp__isCrowdSaleClosed_EPXCrowdsale := isCrowdSaleClosed_EPXCrowdsale;
__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale := areFundsReleasedToBeneficiary_EPXCrowdsale;
__tmp__isCrowdSaleSetup_EPXCrowdsale := isCrowdSaleSetup_EPXCrowdsale;
__tmp__balancesArray_EPXCrowdsale := balancesArray_EPXCrowdsale;
__tmp__usersEPXfundValue_EPXCrowdsale := usersEPXfundValue_EPXCrowdsale;
call response_s391 := SetupCrowdsale_EPXCrowdsale__fail(this, msgsender_MSG, msgvalue_MSG, _fundingStartBlock_s391, _fundingEndBlock_s391);
assume ((revert) || ((gas) < (0)));
} else {
call response_s391 := SetupCrowdsale_EPXCrowdsale__success(this, msgsender_MSG, msgvalue_MSG, _fundingStartBlock_s391, _fundingEndBlock_s391);
assume ((!(revert)) && ((gas) >= (0)));
}
}

procedure {:inline 1} checkPrice_EPXCrowdsale__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (currentPriceValue_s428: int);
procedure {:inline 1} FallbackMethod_EPXCrowdsale__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies revert;
modifies amountRaisedInWei_EPXCrowdsale;
modifies tokensRemaining_EPXCrowdsale;
modifies sum;
modifies M_Ref_int;
procedure {:public} {:inline 1} buy_EPXCrowdsale(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies __tmp__Balance;
modifies __tmp__DType;
modifies __tmp__Alloc;
modifies __tmp__balance_ADDR;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__Length;
modifies __tmp__now;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
modifies Balance;
modifies amountRaisedInWei_EPXCrowdsale;
modifies tokensRemaining_EPXCrowdsale;
modifies sum;
modifies M_Ref_int;
implementation buy_EPXCrowdsale(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __exception: bool;
havoc __exception;
revert := false;
if (__exception) {
__tmp__Balance := Balance;
__tmp__DType := DType;
__tmp__Alloc := Alloc;
__tmp__balance_ADDR := balance_ADDR;
__tmp__M_Ref_int := M_Ref_int;
__tmp__sum := sum;
__tmp__Length := Length;
__tmp__now := now;
__tmp__owner_owned := owner_owned;
__tmp__admin_EPXCrowdsale := admin_EPXCrowdsale;
__tmp__tokenReward_EPXCrowdsale := tokenReward_EPXCrowdsale;
__tmp__initialTokenSupply_EPXCrowdsale := initialTokenSupply_EPXCrowdsale;
__tmp__tokensRemaining_EPXCrowdsale := tokensRemaining_EPXCrowdsale;
__tmp__beneficiaryWallet_EPXCrowdsale := beneficiaryWallet_EPXCrowdsale;
__tmp__amountRaisedInWei_EPXCrowdsale := amountRaisedInWei_EPXCrowdsale;
__tmp__fundingMinCapInWei_EPXCrowdsale := fundingMinCapInWei_EPXCrowdsale;
__tmp__CurrentStatus_EPXCrowdsale := CurrentStatus_EPXCrowdsale;
__tmp__fundingStartBlock_EPXCrowdsale := fundingStartBlock_EPXCrowdsale;
__tmp__fundingEndBlock_EPXCrowdsale := fundingEndBlock_EPXCrowdsale;
__tmp__isCrowdSaleClosed_EPXCrowdsale := isCrowdSaleClosed_EPXCrowdsale;
__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale := areFundsReleasedToBeneficiary_EPXCrowdsale;
__tmp__isCrowdSaleSetup_EPXCrowdsale := isCrowdSaleSetup_EPXCrowdsale;
__tmp__balancesArray_EPXCrowdsale := balancesArray_EPXCrowdsale;
__tmp__usersEPXfundValue_EPXCrowdsale := usersEPXfundValue_EPXCrowdsale;
call buy_EPXCrowdsale__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) || ((gas) < (0)));
} else {
call buy_EPXCrowdsale__success(this, msgsender_MSG, msgvalue_MSG);
assume ((!(revert)) && ((gas) >= (0)));
}
}

procedure {:public} {:inline 1} beneficiaryMultiSigWithdraw_EPXCrowdsale(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _amount_s558: int);
modifies revert;
modifies __tmp__Balance;
modifies __tmp__DType;
modifies __tmp__Alloc;
modifies __tmp__balance_ADDR;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__Length;
modifies __tmp__now;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
modifies gas;
modifies Balance;
modifies amountRaisedInWei_EPXCrowdsale;
modifies tokensRemaining_EPXCrowdsale;
modifies sum;
modifies M_Ref_int;
implementation beneficiaryMultiSigWithdraw_EPXCrowdsale(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _amount_s558: int)
{
var __exception: bool;
havoc __exception;
revert := false;
if (__exception) {
__tmp__Balance := Balance;
__tmp__DType := DType;
__tmp__Alloc := Alloc;
__tmp__balance_ADDR := balance_ADDR;
__tmp__M_Ref_int := M_Ref_int;
__tmp__sum := sum;
__tmp__Length := Length;
__tmp__now := now;
__tmp__owner_owned := owner_owned;
__tmp__admin_EPXCrowdsale := admin_EPXCrowdsale;
__tmp__tokenReward_EPXCrowdsale := tokenReward_EPXCrowdsale;
__tmp__initialTokenSupply_EPXCrowdsale := initialTokenSupply_EPXCrowdsale;
__tmp__tokensRemaining_EPXCrowdsale := tokensRemaining_EPXCrowdsale;
__tmp__beneficiaryWallet_EPXCrowdsale := beneficiaryWallet_EPXCrowdsale;
__tmp__amountRaisedInWei_EPXCrowdsale := amountRaisedInWei_EPXCrowdsale;
__tmp__fundingMinCapInWei_EPXCrowdsale := fundingMinCapInWei_EPXCrowdsale;
__tmp__CurrentStatus_EPXCrowdsale := CurrentStatus_EPXCrowdsale;
__tmp__fundingStartBlock_EPXCrowdsale := fundingStartBlock_EPXCrowdsale;
__tmp__fundingEndBlock_EPXCrowdsale := fundingEndBlock_EPXCrowdsale;
__tmp__isCrowdSaleClosed_EPXCrowdsale := isCrowdSaleClosed_EPXCrowdsale;
__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale := areFundsReleasedToBeneficiary_EPXCrowdsale;
__tmp__isCrowdSaleSetup_EPXCrowdsale := isCrowdSaleSetup_EPXCrowdsale;
__tmp__balancesArray_EPXCrowdsale := balancesArray_EPXCrowdsale;
__tmp__usersEPXfundValue_EPXCrowdsale := usersEPXfundValue_EPXCrowdsale;
call beneficiaryMultiSigWithdraw_EPXCrowdsale__fail(this, msgsender_MSG, msgvalue_MSG, _amount_s558);
assume ((revert) || ((gas) < (0)));
} else {
call beneficiaryMultiSigWithdraw_EPXCrowdsale__success(this, msgsender_MSG, msgvalue_MSG, _amount_s558);
assume ((!(revert)) && ((gas) >= (0)));
}
}

procedure {:public} {:inline 1} checkGoalReached_EPXCrowdsale(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies __tmp__Balance;
modifies __tmp__DType;
modifies __tmp__Alloc;
modifies __tmp__balance_ADDR;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__Length;
modifies __tmp__now;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
modifies areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies isCrowdSaleClosed_EPXCrowdsale;
modifies CurrentStatus_EPXCrowdsale;
implementation checkGoalReached_EPXCrowdsale(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __exception: bool;
havoc __exception;
revert := false;
if (__exception) {
__tmp__Balance := Balance;
__tmp__DType := DType;
__tmp__Alloc := Alloc;
__tmp__balance_ADDR := balance_ADDR;
__tmp__M_Ref_int := M_Ref_int;
__tmp__sum := sum;
__tmp__Length := Length;
__tmp__now := now;
__tmp__owner_owned := owner_owned;
__tmp__admin_EPXCrowdsale := admin_EPXCrowdsale;
__tmp__tokenReward_EPXCrowdsale := tokenReward_EPXCrowdsale;
__tmp__initialTokenSupply_EPXCrowdsale := initialTokenSupply_EPXCrowdsale;
__tmp__tokensRemaining_EPXCrowdsale := tokensRemaining_EPXCrowdsale;
__tmp__beneficiaryWallet_EPXCrowdsale := beneficiaryWallet_EPXCrowdsale;
__tmp__amountRaisedInWei_EPXCrowdsale := amountRaisedInWei_EPXCrowdsale;
__tmp__fundingMinCapInWei_EPXCrowdsale := fundingMinCapInWei_EPXCrowdsale;
__tmp__CurrentStatus_EPXCrowdsale := CurrentStatus_EPXCrowdsale;
__tmp__fundingStartBlock_EPXCrowdsale := fundingStartBlock_EPXCrowdsale;
__tmp__fundingEndBlock_EPXCrowdsale := fundingEndBlock_EPXCrowdsale;
__tmp__isCrowdSaleClosed_EPXCrowdsale := isCrowdSaleClosed_EPXCrowdsale;
__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale := areFundsReleasedToBeneficiary_EPXCrowdsale;
__tmp__isCrowdSaleSetup_EPXCrowdsale := isCrowdSaleSetup_EPXCrowdsale;
__tmp__balancesArray_EPXCrowdsale := balancesArray_EPXCrowdsale;
__tmp__usersEPXfundValue_EPXCrowdsale := usersEPXfundValue_EPXCrowdsale;
call checkGoalReached_EPXCrowdsale__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) || ((gas) < (0)));
} else {
call checkGoalReached_EPXCrowdsale__success(this, msgsender_MSG, msgvalue_MSG);
assume ((!(revert)) && ((gas) >= (0)));
}
}

procedure {:public} {:inline 1} refund_EPXCrowdsale(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies __tmp__Balance;
modifies __tmp__DType;
modifies __tmp__Alloc;
modifies __tmp__balance_ADDR;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__Length;
modifies __tmp__now;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
modifies gas;
modifies sum;
modifies M_Ref_int;
modifies Balance;
modifies amountRaisedInWei_EPXCrowdsale;
modifies tokensRemaining_EPXCrowdsale;
implementation refund_EPXCrowdsale(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __exception: bool;
havoc __exception;
revert := false;
if (__exception) {
__tmp__Balance := Balance;
__tmp__DType := DType;
__tmp__Alloc := Alloc;
__tmp__balance_ADDR := balance_ADDR;
__tmp__M_Ref_int := M_Ref_int;
__tmp__sum := sum;
__tmp__Length := Length;
__tmp__now := now;
__tmp__owner_owned := owner_owned;
__tmp__admin_EPXCrowdsale := admin_EPXCrowdsale;
__tmp__tokenReward_EPXCrowdsale := tokenReward_EPXCrowdsale;
__tmp__initialTokenSupply_EPXCrowdsale := initialTokenSupply_EPXCrowdsale;
__tmp__tokensRemaining_EPXCrowdsale := tokensRemaining_EPXCrowdsale;
__tmp__beneficiaryWallet_EPXCrowdsale := beneficiaryWallet_EPXCrowdsale;
__tmp__amountRaisedInWei_EPXCrowdsale := amountRaisedInWei_EPXCrowdsale;
__tmp__fundingMinCapInWei_EPXCrowdsale := fundingMinCapInWei_EPXCrowdsale;
__tmp__CurrentStatus_EPXCrowdsale := CurrentStatus_EPXCrowdsale;
__tmp__fundingStartBlock_EPXCrowdsale := fundingStartBlock_EPXCrowdsale;
__tmp__fundingEndBlock_EPXCrowdsale := fundingEndBlock_EPXCrowdsale;
__tmp__isCrowdSaleClosed_EPXCrowdsale := isCrowdSaleClosed_EPXCrowdsale;
__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale := areFundsReleasedToBeneficiary_EPXCrowdsale;
__tmp__isCrowdSaleSetup_EPXCrowdsale := isCrowdSaleSetup_EPXCrowdsale;
__tmp__balancesArray_EPXCrowdsale := balancesArray_EPXCrowdsale;
__tmp__usersEPXfundValue_EPXCrowdsale := usersEPXfundValue_EPXCrowdsale;
call refund_EPXCrowdsale__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) || ((gas) < (0)));
} else {
call refund_EPXCrowdsale__success(this, msgsender_MSG, msgvalue_MSG);
assume ((!(revert)) && ((gas) >= (0)));
}
}

procedure {:inline 1} FallbackDispatch__success(from: Ref, to: Ref, amount: int);
modifies Balance;
modifies revert;
modifies amountRaisedInWei_EPXCrowdsale;
modifies tokensRemaining_EPXCrowdsale;
modifies sum;
modifies M_Ref_int;
procedure {:inline 1} Fallback_UnknownType__success(from: Ref, to: Ref, amount: int);
modifies Balance;
procedure {:inline 1} send__success(from: Ref, to: Ref, amount: int) returns (success: bool);
modifies __tmp__Balance;
modifies __tmp__DType;
modifies __tmp__Alloc;
modifies __tmp__balance_ADDR;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__Length;
modifies __tmp__now;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
modifies revert;
modifies Balance;
modifies amountRaisedInWei_EPXCrowdsale;
modifies tokensRemaining_EPXCrowdsale;
modifies sum;
modifies M_Ref_int;
procedure {:inline 1} onlyOwner_pre__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
procedure CorralChoice_owned(this: Ref);
modifies gas;
modifies now;
modifies Alloc;
procedure CorralEntry_owned();
modifies gas;
modifies Alloc;
modifies revert;
modifies __tmp__Balance;
modifies __tmp__DType;
modifies __tmp__Alloc;
modifies __tmp__balance_ADDR;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__Length;
modifies __tmp__now;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
modifies now;
modifies Balance;
modifies owner_owned;
procedure CorralChoice_safeMath(this: Ref);
modifies gas;
modifies now;
modifies Alloc;
procedure CorralEntry_safeMath();
modifies gas;
modifies Alloc;
modifies Balance;
modifies now;
procedure CorralChoice_StandardToken(this: Ref);
modifies gas;
modifies now;
modifies Alloc;
procedure CorralEntry_StandardToken();
modifies gas;
modifies Alloc;
modifies Balance;
modifies owner_owned;
modifies now;
procedure CorralChoice_EPXCrowdsale(this: Ref);
modifies gas;
modifies now;
modifies Alloc;
modifies revert;
modifies __tmp__Balance;
modifies __tmp__DType;
modifies __tmp__Alloc;
modifies __tmp__balance_ADDR;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__Length;
modifies __tmp__now;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
modifies beneficiaryWallet_EPXCrowdsale;
modifies tokenReward_EPXCrowdsale;
modifies fundingMinCapInWei_EPXCrowdsale;
modifies amountRaisedInWei_EPXCrowdsale;
modifies initialTokenSupply_EPXCrowdsale;
modifies tokensRemaining_EPXCrowdsale;
modifies fundingStartBlock_EPXCrowdsale;
modifies fundingEndBlock_EPXCrowdsale;
modifies isCrowdSaleSetup_EPXCrowdsale;
modifies isCrowdSaleClosed_EPXCrowdsale;
modifies CurrentStatus_EPXCrowdsale;
modifies Balance;
modifies sum;
modifies M_Ref_int;
modifies areFundsReleasedToBeneficiary_EPXCrowdsale;
procedure main();
modifies gas;
modifies Alloc;
modifies revert;
modifies __tmp__Balance;
modifies __tmp__DType;
modifies __tmp__Alloc;
modifies __tmp__balance_ADDR;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__Length;
modifies __tmp__now;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
modifies now;
modifies beneficiaryWallet_EPXCrowdsale;
modifies tokenReward_EPXCrowdsale;
modifies fundingMinCapInWei_EPXCrowdsale;
modifies amountRaisedInWei_EPXCrowdsale;
modifies initialTokenSupply_EPXCrowdsale;
modifies tokensRemaining_EPXCrowdsale;
modifies fundingStartBlock_EPXCrowdsale;
modifies fundingEndBlock_EPXCrowdsale;
modifies isCrowdSaleSetup_EPXCrowdsale;
modifies isCrowdSaleClosed_EPXCrowdsale;
modifies CurrentStatus_EPXCrowdsale;
modifies Balance;
modifies sum;
modifies M_Ref_int;
modifies areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies owner_owned;
modifies admin_EPXCrowdsale;
modifies balancesArray_EPXCrowdsale;
modifies usersEPXfundValue_EPXCrowdsale;
var __tmp__Balance: [Ref]int;
var __tmp__DType: [Ref]ContractName;
var __tmp__Alloc: [Ref]bool;
var __tmp__balance_ADDR: [Ref]int;
var __tmp__M_Ref_int: [Ref][Ref]int;
var __tmp__sum: [Ref]int;
var __tmp__Length: [Ref]int;
var __tmp__now: int;
var __tmp__owner_owned: [Ref]Ref;
var __tmp__admin_EPXCrowdsale: [Ref]Ref;
var __tmp__tokenReward_EPXCrowdsale: [Ref]Ref;
var __tmp__initialTokenSupply_EPXCrowdsale: [Ref]int;
var __tmp__tokensRemaining_EPXCrowdsale: [Ref]int;
var __tmp__beneficiaryWallet_EPXCrowdsale: [Ref]Ref;
var __tmp__amountRaisedInWei_EPXCrowdsale: [Ref]int;
var __tmp__fundingMinCapInWei_EPXCrowdsale: [Ref]int;
var __tmp__CurrentStatus_EPXCrowdsale: [Ref]int;
var __tmp__fundingStartBlock_EPXCrowdsale: [Ref]int;
var __tmp__fundingEndBlock_EPXCrowdsale: [Ref]int;
var __tmp__isCrowdSaleClosed_EPXCrowdsale: [Ref]bool;
var __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale: [Ref]bool;
var __tmp__isCrowdSaleSetup_EPXCrowdsale: [Ref]bool;
var __tmp__balancesArray_EPXCrowdsale: [Ref]Ref;
var __tmp__usersEPXfundValue_EPXCrowdsale: [Ref]Ref;
procedure {:inline 1} FreshRefGenerator__fail() returns (newRef: Ref);
modifies __tmp__Alloc;
procedure {:inline 1} owned_owned_NoBaseCtor__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies __tmp__Balance;
modifies __tmp__owner_owned;
procedure {:constructor} {:inline 1} owned_owned__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies owner_owned;
procedure {:constructor} {:inline 1} owned_owned__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies __tmp__Balance;
modifies __tmp__owner_owned;
procedure {:inline 1} safeMath_safeMath_NoBaseCtor__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies __tmp__Balance;
procedure {:inline 1} safeMath_safeMath__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
procedure {:inline 1} safeMath_safeMath__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies __tmp__Balance;
procedure {:inline 1} safeMul_safeMath__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s54: int, b_s54: int) returns (__ret_0_: int);
modifies revert;
procedure {:inline 1} safeDiv_safeMath__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s90: int, b_s90: int) returns (__ret_0_: int);
modifies revert;
procedure {:inline 1} safeSub_safeMath__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s110: int, b_s110: int) returns (__ret_0_: int);
modifies revert;
procedure {:inline 1} safeAdd_safeMath__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s138: int, b_s138: int) returns (__ret_0_: int);
modifies revert;
procedure {:inline 1} safeAssert_safeMath__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, assertion_s150: bool);
modifies revert;
procedure {:inline 1} StandardToken_StandardToken_NoBaseCtor__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies __tmp__Balance;
procedure {:inline 1} StandardToken_StandardToken__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies owner_owned;
procedure {:inline 1} StandardToken_StandardToken__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies __tmp__Balance;
modifies __tmp__owner_owned;
procedure {:inline 1} EPXCrowdsale_EPXCrowdsale_NoBaseCtor__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies __tmp__Balance;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
modifies __tmp__Alloc;
modifies revert;
procedure {:constructor} {:inline 1} EPXCrowdsale_EPXCrowdsale__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies owner_owned;
modifies admin_EPXCrowdsale;
modifies initialTokenSupply_EPXCrowdsale;
modifies tokensRemaining_EPXCrowdsale;
modifies beneficiaryWallet_EPXCrowdsale;
modifies amountRaisedInWei_EPXCrowdsale;
modifies fundingMinCapInWei_EPXCrowdsale;
modifies CurrentStatus_EPXCrowdsale;
modifies fundingStartBlock_EPXCrowdsale;
modifies fundingEndBlock_EPXCrowdsale;
modifies isCrowdSaleClosed_EPXCrowdsale;
modifies areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies isCrowdSaleSetup_EPXCrowdsale;
modifies balancesArray_EPXCrowdsale;
modifies M_Ref_int;
modifies sum;
modifies usersEPXfundValue_EPXCrowdsale;
modifies Alloc;
modifies revert;
procedure {:constructor} {:inline 1} EPXCrowdsale_EPXCrowdsale__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies __tmp__Balance;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
modifies __tmp__Alloc;
modifies revert;
procedure {:inline 1} initialEPXSupply_EPXCrowdsale__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (initialEPXtokenCount_s286: int);
modifies revert;
procedure {:inline 1} initialEPXSupply_EPXCrowdsale__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (initialEPXtokenCount_s286: int);
modifies revert;
procedure {:inline 1} remainingEPXSupply_EPXCrowdsale__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (remainingEPXtokenCount_s299: int);
modifies revert;
procedure {:inline 1} remainingEPXSupply_EPXCrowdsale__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (remainingEPXtokenCount_s299: int);
modifies revert;
procedure {:inline 1} SetupCrowdsale_EPXCrowdsale__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _fundingStartBlock_s391: int, _fundingEndBlock_s391: int) returns (response_s391: int);
modifies beneficiaryWallet_EPXCrowdsale;
modifies tokenReward_EPXCrowdsale;
modifies fundingMinCapInWei_EPXCrowdsale;
modifies amountRaisedInWei_EPXCrowdsale;
modifies initialTokenSupply_EPXCrowdsale;
modifies tokensRemaining_EPXCrowdsale;
modifies fundingStartBlock_EPXCrowdsale;
modifies fundingEndBlock_EPXCrowdsale;
modifies isCrowdSaleSetup_EPXCrowdsale;
modifies isCrowdSaleClosed_EPXCrowdsale;
modifies CurrentStatus_EPXCrowdsale;
modifies revert;
procedure {:inline 1} SetupCrowdsale_EPXCrowdsale__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _fundingStartBlock_s391: int, _fundingEndBlock_s391: int) returns (response_s391: int);
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies revert;
procedure {:inline 1} checkPrice_EPXCrowdsale__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (currentPriceValue_s428: int);
procedure {:inline 1} FallbackMethod_EPXCrowdsale__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies __tmp__Balance;
modifies revert;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__sum;
modifies __tmp__M_Ref_int;
procedure {:inline 1} buy_EPXCrowdsale__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies revert;
modifies amountRaisedInWei_EPXCrowdsale;
modifies tokensRemaining_EPXCrowdsale;
modifies sum;
modifies M_Ref_int;
procedure {:inline 1} buy_EPXCrowdsale__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies __tmp__Balance;
modifies revert;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__sum;
modifies __tmp__M_Ref_int;
procedure {:inline 1} beneficiaryMultiSigWithdraw_EPXCrowdsale__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _amount_s558: int);
modifies revert;
modifies gas;
modifies __tmp__Balance;
modifies __tmp__DType;
modifies __tmp__Alloc;
modifies __tmp__balance_ADDR;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__Length;
modifies __tmp__now;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
modifies Balance;
modifies amountRaisedInWei_EPXCrowdsale;
modifies tokensRemaining_EPXCrowdsale;
modifies sum;
modifies M_Ref_int;
procedure {:inline 1} beneficiaryMultiSigWithdraw_EPXCrowdsale__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _amount_s558: int);
modifies revert;
modifies gas;
modifies __tmp__Balance;
modifies __tmp__DType;
modifies __tmp__Alloc;
modifies __tmp__balance_ADDR;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__Length;
modifies __tmp__now;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
procedure {:inline 1} checkGoalReached_EPXCrowdsale__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies isCrowdSaleClosed_EPXCrowdsale;
modifies CurrentStatus_EPXCrowdsale;
procedure {:inline 1} checkGoalReached_EPXCrowdsale__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
procedure {:inline 1} refund_EPXCrowdsale__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies sum;
modifies M_Ref_int;
modifies gas;
modifies __tmp__Balance;
modifies __tmp__DType;
modifies __tmp__Alloc;
modifies __tmp__balance_ADDR;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__Length;
modifies __tmp__now;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
modifies Balance;
modifies amountRaisedInWei_EPXCrowdsale;
modifies tokensRemaining_EPXCrowdsale;
procedure {:inline 1} refund_EPXCrowdsale__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies __tmp__sum;
modifies __tmp__M_Ref_int;
modifies gas;
modifies __tmp__Balance;
modifies __tmp__DType;
modifies __tmp__Alloc;
modifies __tmp__balance_ADDR;
modifies __tmp__Length;
modifies __tmp__now;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
procedure {:inline 1} FallbackDispatch__fail(from: Ref, to: Ref, amount: int);
modifies __tmp__Balance;
modifies revert;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__sum;
modifies __tmp__M_Ref_int;
procedure {:inline 1} Fallback_UnknownType__fail(from: Ref, to: Ref, amount: int);
modifies __tmp__Balance;
procedure {:inline 1} send__fail(from: Ref, to: Ref, amount: int) returns (success: bool);
modifies __tmp__Balance;
modifies __tmp__DType;
modifies __tmp__Alloc;
modifies __tmp__balance_ADDR;
modifies __tmp__M_Ref_int;
modifies __tmp__sum;
modifies __tmp__Length;
modifies __tmp__now;
modifies __tmp__owner_owned;
modifies __tmp__admin_EPXCrowdsale;
modifies __tmp__tokenReward_EPXCrowdsale;
modifies __tmp__initialTokenSupply_EPXCrowdsale;
modifies __tmp__tokensRemaining_EPXCrowdsale;
modifies __tmp__beneficiaryWallet_EPXCrowdsale;
modifies __tmp__amountRaisedInWei_EPXCrowdsale;
modifies __tmp__fundingMinCapInWei_EPXCrowdsale;
modifies __tmp__CurrentStatus_EPXCrowdsale;
modifies __tmp__fundingStartBlock_EPXCrowdsale;
modifies __tmp__fundingEndBlock_EPXCrowdsale;
modifies __tmp__isCrowdSaleClosed_EPXCrowdsale;
modifies __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
modifies __tmp__isCrowdSaleSetup_EPXCrowdsale;
modifies __tmp__balancesArray_EPXCrowdsale;
modifies __tmp__usersEPXfundValue_EPXCrowdsale;
modifies revert;
procedure {:inline 1} onlyOwner_pre__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
implementation FreshRefGenerator__fail() returns (newRef: Ref)
{
havoc newRef;
assume ((__tmp__Alloc[newRef]) == (false));
__tmp__Alloc[newRef] := true;
assume ((newRef) != (null));
}

implementation FreshRefGenerator__success() returns (newRef: Ref)
{
havoc newRef;
assume ((Alloc[newRef]) == (false));
Alloc[newRef] := true;
assume ((newRef) != (null));
}

implementation owned_owned_NoBaseCtor__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// start of initialization
assume ((msgsender_MSG) != (null));
__tmp__Balance[this] := 0;
__tmp__owner_owned[this] := null;
// end of initialization
__tmp__owner_owned[this] := msgsender_MSG;
}

implementation owned_owned_NoBaseCtor__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// start of initialization
assume ((msgsender_MSG) != (null));
Balance[this] := 0;
owner_owned[this] := null;
// end of initialization
owner_owned[this] := msgsender_MSG;
}

implementation owned_owned__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call owned_owned_NoBaseCtor__fail(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
}

implementation owned_owned__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call owned_owned_NoBaseCtor__success(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
}

implementation safeMath_safeMath_NoBaseCtor__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// start of initialization
assume ((msgsender_MSG) != (null));
__tmp__Balance[this] := 0;
// end of initialization
}

implementation safeMath_safeMath_NoBaseCtor__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// start of initialization
assume ((msgsender_MSG) != (null));
Balance[this] := 0;
// end of initialization
}

implementation safeMath_safeMath__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call safeMath_safeMath_NoBaseCtor__fail(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
}

implementation safeMath_safeMath__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call safeMath_safeMath_NoBaseCtor__success(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
}

// implementation safeMul_safeMath__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s54: int, b_s54: int) returns (__ret_0_: int)
// {
// var c_s53: int;
// assume ((c_s53) >= (0));
// assume ((a_s54) >= (0));
// assume ((b_s54) >= (0));
// assume (((a_s54) * (b_s54)) >= (0));
// c_s53 := (a_s54) * (b_s54);
// assume ((a_s54) >= (0));
// assume ((c_s53) >= (0));
// assume ((a_s54) >= (0));
// assume (((c_s53) div (a_s54)) >= (0));
// assume ((b_s54) >= (0));
// if ((__tmp__DType[this]) == (EPXCrowdsale)) {
// call safeAssert_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, ((a_s54) == (0)) || (((c_s53) div (a_s54)) == (b_s54)));
// if (revert) {
// return;
// }
// } else if ((__tmp__DType[this]) == (StandardToken)) {
// call safeAssert_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, ((a_s54) == (0)) || (((c_s53) div (a_s54)) == (b_s54)));
// if (revert) {
// return;
// }
// } else if ((__tmp__DType[this]) == (safeMath)) {
// call safeAssert_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, ((a_s54) == (0)) || (((c_s53) div (a_s54)) == (b_s54)));
// if (revert) {
// return;
// }
// } else {
// assume (false);
// }
// assume ((c_s53) >= (0));
// __ret_0_ := c_s53;
// return;
// }

// implementation safeMul_safeMath__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s54: int, b_s54: int) returns (__ret_0_: int)
// {
// var c_s53: int;
// assume ((c_s53) >= (0));
// assume ((a_s54) >= (0));
// assume ((b_s54) >= (0));
// assume (((a_s54) * (b_s54)) >= (0));
// c_s53 := (a_s54) * (b_s54);
// assume ((a_s54) >= (0));
// assume ((c_s53) >= (0));
// assume ((a_s54) >= (0));
// assume (((c_s53) div (a_s54)) >= (0));
// assume ((b_s54) >= (0));
// if ((DType[this]) == (EPXCrowdsale)) {
// call safeAssert_safeMath__success(this, msgsender_MSG, msgvalue_MSG, ((a_s54) == (0)) || (((c_s53) div (a_s54)) == (b_s54)));
// if (revert) {
// return;
// }
// } else if ((DType[this]) == (StandardToken)) {
// call safeAssert_safeMath__success(this, msgsender_MSG, msgvalue_MSG, ((a_s54) == (0)) || (((c_s53) div (a_s54)) == (b_s54)));
// if (revert) {
// return;
// }
// } else if ((DType[this]) == (safeMath)) {
// call safeAssert_safeMath__success(this, msgsender_MSG, msgvalue_MSG, ((a_s54) == (0)) || (((c_s53) div (a_s54)) == (b_s54)));
// if (revert) {
// return;
// }
// } else {
// assume (false);
// }
// assume ((c_s53) >= (0));
// __ret_0_ := c_s53;
// return;
// }

// implementation safeDiv_safeMath__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s90: int, b_s90: int) returns (__ret_0_: int)
// {
// var c_s89: int;
// assume ((b_s90) >= (0));
// if ((__tmp__DType[this]) == (EPXCrowdsale)) {
// call safeAssert_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, (b_s90) > (0));
// if (revert) {
// return;
// }
// } else if ((__tmp__DType[this]) == (StandardToken)) {
// call safeAssert_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, (b_s90) > (0));
// if (revert) {
// return;
// }
// } else if ((__tmp__DType[this]) == (safeMath)) {
// call safeAssert_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, (b_s90) > (0));
// if (revert) {
// return;
// }
// } else {
// assume (false);
// }
// assume ((c_s89) >= (0));
// assume ((a_s90) >= (0));
// assume ((b_s90) >= (0));
// assume (((a_s90) div (b_s90)) >= (0));
// c_s89 := (a_s90) div (b_s90);
// assume ((a_s90) >= (0));
// assume ((b_s90) >= (0));
// assume ((c_s89) >= (0));
// assume (((b_s90) * (c_s89)) >= (0));
// assume ((a_s90) >= (0));
// assume ((b_s90) >= (0));
// assume (((a_s90) mod (b_s90)) >= (0));
// assume ((((b_s90) * (c_s89)) + ((a_s90) mod (b_s90))) >= (0));
// if ((__tmp__DType[this]) == (EPXCrowdsale)) {
// call safeAssert_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, (a_s90) == (((b_s90) * (c_s89)) + ((a_s90) mod (b_s90))));
// if (revert) {
// return;
// }
// } else if ((__tmp__DType[this]) == (StandardToken)) {
// call safeAssert_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, (a_s90) == (((b_s90) * (c_s89)) + ((a_s90) mod (b_s90))));
// if (revert) {
// return;
// }
// } else if ((__tmp__DType[this]) == (safeMath)) {
// call safeAssert_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, (a_s90) == (((b_s90) * (c_s89)) + ((a_s90) mod (b_s90))));
// if (revert) {
// return;
// }
// } else {
// assume (false);
// }
// assume ((c_s89) >= (0));
// __ret_0_ := c_s89;
// return;
// }

// implementation safeDiv_safeMath__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s90: int, b_s90: int) returns (__ret_0_: int)
// {
// var c_s89: int;
// assume ((b_s90) >= (0));
// if ((DType[this]) == (EPXCrowdsale)) {
// call safeAssert_safeMath__success(this, msgsender_MSG, msgvalue_MSG, (b_s90) > (0));
// if (revert) {
// return;
// }
// } else if ((DType[this]) == (StandardToken)) {
// call safeAssert_safeMath__success(this, msgsender_MSG, msgvalue_MSG, (b_s90) > (0));
// if (revert) {
// return;
// }
// } else if ((DType[this]) == (safeMath)) {
// call safeAssert_safeMath__success(this, msgsender_MSG, msgvalue_MSG, (b_s90) > (0));
// if (revert) {
// return;
// }
// } else {
// assume (false);
// }
// assume ((c_s89) >= (0));
// assume ((a_s90) >= (0));
// assume ((b_s90) >= (0));
// assume (((a_s90) div (b_s90)) >= (0));
// c_s89 := (a_s90) div (b_s90);
// assume ((a_s90) >= (0));
// assume ((b_s90) >= (0));
// assume ((c_s89) >= (0));
// assume (((b_s90) * (c_s89)) >= (0));
// assume ((a_s90) >= (0));
// assume ((b_s90) >= (0));
// assume (((a_s90) mod (b_s90)) >= (0));
// assume ((((b_s90) * (c_s89)) + ((a_s90) mod (b_s90))) >= (0));
// if ((DType[this]) == (EPXCrowdsale)) {
// call safeAssert_safeMath__success(this, msgsender_MSG, msgvalue_MSG, (a_s90) == (((b_s90) * (c_s89)) + ((a_s90) mod (b_s90))));
// if (revert) {
// return;
// }
// } else if ((DType[this]) == (StandardToken)) {
// call safeAssert_safeMath__success(this, msgsender_MSG, msgvalue_MSG, (a_s90) == (((b_s90) * (c_s89)) + ((a_s90) mod (b_s90))));
// if (revert) {
// return;
// }
// } else if ((DType[this]) == (safeMath)) {
// call safeAssert_safeMath__success(this, msgsender_MSG, msgvalue_MSG, (a_s90) == (((b_s90) * (c_s89)) + ((a_s90) mod (b_s90))));
// if (revert) {
// return;
// }
// } else {
// assume (false);
// }
// assume ((c_s89) >= (0));
// __ret_0_ := c_s89;
// return;
// }

implementation safeSub_safeMath__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s110: int, b_s110: int) returns (__ret_0_: int)
{
assume ((b_s110) >= (0));
assume ((a_s110) >= (0));
if ((__tmp__DType[this]) == (EPXCrowdsale)) {
call safeAssert_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, (b_s110) <= (a_s110));
if (revert) {
return;
}
} else if ((__tmp__DType[this]) == (StandardToken)) {
call safeAssert_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, (b_s110) <= (a_s110));
if (revert) {
return;
}
} else if ((__tmp__DType[this]) == (safeMath)) {
call safeAssert_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, (b_s110) <= (a_s110));
if (revert) {
return;
}
} else {
assume (false);
}
assume ((a_s110) >= (0));
assume ((b_s110) >= (0));
assume (((a_s110) - (b_s110)) >= (0));
__ret_0_ := (a_s110) - (b_s110);
return;
}

implementation safeSub_safeMath__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s110: int, b_s110: int) returns (__ret_0_: int)
{
assume ((b_s110) >= (0));
assume ((a_s110) >= (0));
if ((DType[this]) == (EPXCrowdsale)) {
call safeAssert_safeMath__success(this, msgsender_MSG, msgvalue_MSG, (b_s110) <= (a_s110));
if (revert) {
return;
}
} else if ((DType[this]) == (StandardToken)) {
call safeAssert_safeMath__success(this, msgsender_MSG, msgvalue_MSG, (b_s110) <= (a_s110));
if (revert) {
return;
}
} else if ((DType[this]) == (safeMath)) {
call safeAssert_safeMath__success(this, msgsender_MSG, msgvalue_MSG, (b_s110) <= (a_s110));
if (revert) {
return;
}
} else {
assume (false);
}
assume ((a_s110) >= (0));
assume ((b_s110) >= (0));
assume (((a_s110) - (b_s110)) >= (0));
__ret_0_ := (a_s110) - (b_s110);
return;
}

implementation safeAdd_safeMath__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s138: int, b_s138: int) returns (__ret_0_: int)
{
var c_s137: int;
assume ((c_s137) >= (0));
assume ((a_s138) >= (0));
assume ((b_s138) >= (0));
assume (((a_s138) + (b_s138)) >= (0));
c_s137 := (a_s138) + (b_s138);
assume ((c_s137) >= (0));
assume ((a_s138) >= (0));
assume ((c_s137) >= (0));
assume ((b_s138) >= (0));
if ((__tmp__DType[this]) == (EPXCrowdsale)) {
call safeAssert_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, ((c_s137) >= (a_s138)) && ((c_s137) >= (b_s138)));
if (revert) {
return;
}
} else if ((__tmp__DType[this]) == (StandardToken)) {
call safeAssert_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, ((c_s137) >= (a_s138)) && ((c_s137) >= (b_s138)));
if (revert) {
return;
}
} else if ((__tmp__DType[this]) == (safeMath)) {
call safeAssert_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, ((c_s137) >= (a_s138)) && ((c_s137) >= (b_s138)));
if (revert) {
return;
}
} else {
assume (false);
}
assume ((c_s137) >= (0));
__ret_0_ := c_s137;
return;
}

implementation safeAdd_safeMath__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s138: int, b_s138: int) returns (__ret_0_: int)
{
var c_s137: int;
assume ((c_s137) >= (0));
assume ((a_s138) >= (0));
assume ((b_s138) >= (0));
assume (((a_s138) + (b_s138)) >= (0));
c_s137 := (a_s138) + (b_s138);
assume ((c_s137) >= (0));
assume ((a_s138) >= (0));
assume ((c_s137) >= (0));
assume ((b_s138) >= (0));
if ((DType[this]) == (EPXCrowdsale)) {
call safeAssert_safeMath__success(this, msgsender_MSG, msgvalue_MSG, ((c_s137) >= (a_s138)) && ((c_s137) >= (b_s138)));
if (revert) {
return;
}
} else if ((DType[this]) == (StandardToken)) {
call safeAssert_safeMath__success(this, msgsender_MSG, msgvalue_MSG, ((c_s137) >= (a_s138)) && ((c_s137) >= (b_s138)));
if (revert) {
return;
}
} else if ((DType[this]) == (safeMath)) {
call safeAssert_safeMath__success(this, msgsender_MSG, msgvalue_MSG, ((c_s137) >= (a_s138)) && ((c_s137) >= (b_s138)));
if (revert) {
return;
}
} else {
assume (false);
}
assume ((c_s137) >= (0));
__ret_0_ := c_s137;
return;
}

implementation safeAssert_safeMath__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, assertion_s150: bool)
{
if (!(assertion_s150)) {
revert := true;
return;
}
}

implementation safeAssert_safeMath__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, assertion_s150: bool)
{
if (!(assertion_s150)) {
revert := true;
return;
}
}

implementation StandardToken_StandardToken_NoBaseCtor__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// start of initialization
assume ((msgsender_MSG) != (null));
__tmp__Balance[this] := 0;
// end of initialization
}

implementation StandardToken_StandardToken_NoBaseCtor__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// start of initialization
assume ((msgsender_MSG) != (null));
Balance[this] := 0;
// end of initialization
}

implementation StandardToken_StandardToken__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call owned_owned__fail(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
call safeMath_safeMath__fail(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
call StandardToken_StandardToken_NoBaseCtor__fail(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
}

implementation StandardToken_StandardToken__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call owned_owned__success(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
call safeMath_safeMath__success(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
call StandardToken_StandardToken_NoBaseCtor__success(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
}

implementation EPXCrowdsale_EPXCrowdsale_NoBaseCtor__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __var_1: Ref;
var __var_2: Ref;
// start of initialization
assume ((msgsender_MSG) != (null));
__tmp__Balance[this] := 0;
__tmp__admin_EPXCrowdsale[this] := null;
__tmp__initialTokenSupply_EPXCrowdsale[this] := 0;
__tmp__tokensRemaining_EPXCrowdsale[this] := 0;
__tmp__beneficiaryWallet_EPXCrowdsale[this] := null;
__tmp__amountRaisedInWei_EPXCrowdsale[this] := 0;
__tmp__fundingMinCapInWei_EPXCrowdsale[this] := 0;
__tmp__CurrentStatus_EPXCrowdsale[this] := -770254192;
__tmp__fundingStartBlock_EPXCrowdsale[this] := 0;
__tmp__fundingEndBlock_EPXCrowdsale[this] := 0;
__tmp__isCrowdSaleClosed_EPXCrowdsale[this] := false;
__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale[this] := false;
__tmp__isCrowdSaleSetup_EPXCrowdsale[this] := false;
// Make array/mapping vars distinct for balancesArray
call __var_1 := FreshRefGenerator__fail();
if (revert) {
return;
}
__tmp__balancesArray_EPXCrowdsale[this] := __var_1;
// Initialize Integer mapping balancesArray
__tmp__M_Ref_int[__tmp__balancesArray_EPXCrowdsale[this]] := zeroRefIntArr();
__tmp__sum[__tmp__balancesArray_EPXCrowdsale[this]] := 0;
// Make array/mapping vars distinct for usersEPXfundValue
call __var_2 := FreshRefGenerator__fail();
if (revert) {
return;
}
__tmp__usersEPXfundValue_EPXCrowdsale[this] := __var_2;
// Initialize Integer mapping usersEPXfundValue
__tmp__M_Ref_int[__tmp__usersEPXfundValue_EPXCrowdsale[this]] := zeroRefIntArr();
__tmp__sum[__tmp__usersEPXfundValue_EPXCrowdsale[this]] := 0;
// end of initialization
call onlyOwner_pre__fail(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
__tmp__admin_EPXCrowdsale[this] := msgsender_MSG;
__tmp__CurrentStatus_EPXCrowdsale[this] := 779101658;
}

implementation EPXCrowdsale_EPXCrowdsale_NoBaseCtor__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __var_1: Ref;
var __var_2: Ref;
// start of initialization
assume ((msgsender_MSG) != (null));
Balance[this] := 0;
admin_EPXCrowdsale[this] := null;
initialTokenSupply_EPXCrowdsale[this] := 0;
tokensRemaining_EPXCrowdsale[this] := 0;
beneficiaryWallet_EPXCrowdsale[this] := null;
amountRaisedInWei_EPXCrowdsale[this] := 0;
fundingMinCapInWei_EPXCrowdsale[this] := 0;
CurrentStatus_EPXCrowdsale[this] := -770254192;
fundingStartBlock_EPXCrowdsale[this] := 0;
fundingEndBlock_EPXCrowdsale[this] := 0;
isCrowdSaleClosed_EPXCrowdsale[this] := false;
areFundsReleasedToBeneficiary_EPXCrowdsale[this] := false;
isCrowdSaleSetup_EPXCrowdsale[this] := false;
// Make array/mapping vars distinct for balancesArray
call __var_1 := FreshRefGenerator__success();
if (revert) {
return;
}
balancesArray_EPXCrowdsale[this] := __var_1;
// Initialize Integer mapping balancesArray
M_Ref_int[balancesArray_EPXCrowdsale[this]] := zeroRefIntArr();
sum[balancesArray_EPXCrowdsale[this]] := 0;
// Make array/mapping vars distinct for usersEPXfundValue
call __var_2 := FreshRefGenerator__success();
if (revert) {
return;
}
usersEPXfundValue_EPXCrowdsale[this] := __var_2;
// Initialize Integer mapping usersEPXfundValue
M_Ref_int[usersEPXfundValue_EPXCrowdsale[this]] := zeroRefIntArr();
sum[usersEPXfundValue_EPXCrowdsale[this]] := 0;
// end of initialization
call onlyOwner_pre__success(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
admin_EPXCrowdsale[this] := msgsender_MSG;
CurrentStatus_EPXCrowdsale[this] := 779101658;
}

implementation EPXCrowdsale_EPXCrowdsale__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __var_1: Ref;
var __var_2: Ref;
call owned_owned__fail(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
call safeMath_safeMath__fail(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
call EPXCrowdsale_EPXCrowdsale_NoBaseCtor__fail(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
}

implementation EPXCrowdsale_EPXCrowdsale__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __var_1: Ref;
var __var_2: Ref;
call owned_owned__success(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
call safeMath_safeMath__success(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
call EPXCrowdsale_EPXCrowdsale_NoBaseCtor__success(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
}

implementation initialEPXSupply_EPXCrowdsale__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (initialEPXtokenCount_s286: int)
{
var __var_3: int;
var __var_4: int;
assume ((__var_3) >= (0));
assume ((__tmp__initialTokenSupply_EPXCrowdsale[this]) >= (0));
assume ((__var_4) >= (0));
__var_4 := 10000;
assume ((10000) >= (0));
if ((__tmp__DType[this]) == (EPXCrowdsale)) {
call __var_3 := safeDiv_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, __tmp__initialTokenSupply_EPXCrowdsale[this], 10000);
if (revert) {
return;
}
} else {
assume (false);
}
assume ((__var_3) >= (0));
initialEPXtokenCount_s286 := __var_3;
return;
}

implementation initialEPXSupply_EPXCrowdsale__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (initialEPXtokenCount_s286: int)
{
var __var_3: int;
var __var_4: int;
assume ((__var_3) >= (0));
assume ((initialTokenSupply_EPXCrowdsale[this]) >= (0));
assume ((__var_4) >= (0));
__var_4 := 10000;
assume ((10000) >= (0));
if ((DType[this]) == (EPXCrowdsale)) {
call __var_3 := safeDiv_safeMath__success(this, msgsender_MSG, msgvalue_MSG, initialTokenSupply_EPXCrowdsale[this], 10000);
if (revert) {
return;
}
} else {
assume (false);
}
assume ((__var_3) >= (0));
initialEPXtokenCount_s286 := __var_3;
return;
}

implementation remainingEPXSupply_EPXCrowdsale__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (remainingEPXtokenCount_s299: int)
{
var __var_5: int;
var __var_6: int;
assume ((__var_5) >= (0));
assume ((__tmp__tokensRemaining_EPXCrowdsale[this]) >= (0));
assume ((__var_6) >= (0));
__var_6 := 10000;
assume ((10000) >= (0));
if ((__tmp__DType[this]) == (EPXCrowdsale)) {
call __var_5 := safeDiv_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, __tmp__tokensRemaining_EPXCrowdsale[this], 10000);
if (revert) {
return;
}
} else {
assume (false);
}
assume ((__var_5) >= (0));
remainingEPXtokenCount_s299 := __var_5;
return;
}

implementation remainingEPXSupply_EPXCrowdsale__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (remainingEPXtokenCount_s299: int)
{
var __var_5: int;
var __var_6: int;
assume ((__var_5) >= (0));
assume ((tokensRemaining_EPXCrowdsale[this]) >= (0));
assume ((__var_6) >= (0));
__var_6 := 10000;
assume ((10000) >= (0));
if ((DType[this]) == (EPXCrowdsale)) {
call __var_5 := safeDiv_safeMath__success(this, msgsender_MSG, msgvalue_MSG, tokensRemaining_EPXCrowdsale[this], 10000);
if (revert) {
return;
}
} else {
assume (false);
}
assume ((__var_5) >= (0));
remainingEPXtokenCount_s299 := __var_5;
return;
}

implementation SetupCrowdsale_EPXCrowdsale__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _fundingStartBlock_s391: int, _fundingEndBlock_s391: int) returns (response_s391: int)
{
var __var_7: Ref;
var __var_8: Ref;
call onlyOwner_pre__fail(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
__var_7 := null;
if (((((msgsender_MSG) == (__tmp__admin_EPXCrowdsale[this]))) && ((!((__tmp__isCrowdSaleSetup_EPXCrowdsale[this]))))) && ((!(((__tmp__beneficiaryWallet_EPXCrowdsale[this]) > (null)))))) {
__tmp__beneficiaryWallet_EPXCrowdsale[this] := 697430822632970301078135277991899223861541828538;
assume ((__tmp__DType[306739008177065458245547523748999887630099779917]) == (StandardToken));
__var_8 := 306739008177065458245547523748999887630099779917;
__tmp__tokenReward_EPXCrowdsale[this] := __var_8;
assume ((__tmp__fundingMinCapInWei_EPXCrowdsale[this]) >= (0));
__tmp__fundingMinCapInWei_EPXCrowdsale[this] := 30000000000000000000;
assume ((__tmp__amountRaisedInWei_EPXCrowdsale[this]) >= (0));
__tmp__amountRaisedInWei_EPXCrowdsale[this] := 0;
assume ((__tmp__initialTokenSupply_EPXCrowdsale[this]) >= (0));
__tmp__initialTokenSupply_EPXCrowdsale[this] := 200000000000;
assume ((__tmp__tokensRemaining_EPXCrowdsale[this]) >= (0));
assume ((__tmp__initialTokenSupply_EPXCrowdsale[this]) >= (0));
__tmp__tokensRemaining_EPXCrowdsale[this] := __tmp__initialTokenSupply_EPXCrowdsale[this];
assume ((__tmp__fundingStartBlock_EPXCrowdsale[this]) >= (0));
assume ((_fundingStartBlock_s391) >= (0));
__tmp__fundingStartBlock_EPXCrowdsale[this] := _fundingStartBlock_s391;
assume ((__tmp__fundingEndBlock_EPXCrowdsale[this]) >= (0));
assume ((_fundingEndBlock_s391) >= (0));
__tmp__fundingEndBlock_EPXCrowdsale[this] := _fundingEndBlock_s391;
__tmp__isCrowdSaleSetup_EPXCrowdsale[this] := true;
__tmp__isCrowdSaleClosed_EPXCrowdsale[this] := false;
__tmp__CurrentStatus_EPXCrowdsale[this] := 1119182379;
response_s391 := 1119182379;
return;
} else if ((msgsender_MSG) != (__tmp__admin_EPXCrowdsale[this])) {
response_s391 := 62782527;
return;
} else {
response_s391 := 899647175;
return;
}
}

implementation SetupCrowdsale_EPXCrowdsale__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _fundingStartBlock_s391: int, _fundingEndBlock_s391: int) returns (response_s391: int)
{
var __var_7: Ref;
var __var_8: Ref;
call onlyOwner_pre__success(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
__var_7 := null;
if (((((msgsender_MSG) == (admin_EPXCrowdsale[this]))) && ((!((isCrowdSaleSetup_EPXCrowdsale[this]))))) && ((!(((beneficiaryWallet_EPXCrowdsale[this]) > (null)))))) {
beneficiaryWallet_EPXCrowdsale[this] := 697430822632970301078135277991899223861541828538;
assume ((DType[306739008177065458245547523748999887630099779917]) == (StandardToken));
__var_8 := 306739008177065458245547523748999887630099779917;
tokenReward_EPXCrowdsale[this] := __var_8;
assume ((fundingMinCapInWei_EPXCrowdsale[this]) >= (0));
fundingMinCapInWei_EPXCrowdsale[this] := 30000000000000000000;
assume ((amountRaisedInWei_EPXCrowdsale[this]) >= (0));
amountRaisedInWei_EPXCrowdsale[this] := 0;
assume ((initialTokenSupply_EPXCrowdsale[this]) >= (0));
initialTokenSupply_EPXCrowdsale[this] := 200000000000;
assume ((tokensRemaining_EPXCrowdsale[this]) >= (0));
assume ((initialTokenSupply_EPXCrowdsale[this]) >= (0));
tokensRemaining_EPXCrowdsale[this] := initialTokenSupply_EPXCrowdsale[this];
assume ((fundingStartBlock_EPXCrowdsale[this]) >= (0));
assume ((_fundingStartBlock_s391) >= (0));
fundingStartBlock_EPXCrowdsale[this] := _fundingStartBlock_s391;
assume ((fundingEndBlock_EPXCrowdsale[this]) >= (0));
assume ((_fundingEndBlock_s391) >= (0));
fundingEndBlock_EPXCrowdsale[this] := _fundingEndBlock_s391;
isCrowdSaleSetup_EPXCrowdsale[this] := true;
isCrowdSaleClosed_EPXCrowdsale[this] := false;
CurrentStatus_EPXCrowdsale[this] := 1119182379;
response_s391 := 1119182379;
return;
} else if ((msgsender_MSG) != (admin_EPXCrowdsale[this])) {
response_s391 := 62782527;
return;
} else {
response_s391 := 899647175;
return;
}
}

implementation checkPrice_EPXCrowdsale__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (currentPriceValue_s428: int)
{
var __var_9: int;
var __var_10: int;
var __var_11: int;
// Non-deterministic value to model block.number
havoc __var_9;
assume ((__var_9) >= (0));
assume ((__tmp__fundingStartBlock_EPXCrowdsale[this]) >= (0));
assume (((__tmp__fundingStartBlock_EPXCrowdsale[this]) + (177534)) >= (0));
if ((__var_9) >= ((__tmp__fundingStartBlock_EPXCrowdsale[this]) + (177534))) {
currentPriceValue_s428 := 7600;
return;
} else {
// Non-deterministic value to model block.number
havoc __var_10;
assume ((__var_10) >= (0));
assume ((__tmp__fundingStartBlock_EPXCrowdsale[this]) >= (0));
assume (((__tmp__fundingStartBlock_EPXCrowdsale[this]) + (124274)) >= (0));
if ((__var_10) >= ((__tmp__fundingStartBlock_EPXCrowdsale[this]) + (124274))) {
currentPriceValue_s428 := 8200;
return;
} else {
// Non-deterministic value to model block.number
havoc __var_11;
assume ((__var_11) >= (0));
assume ((__tmp__fundingStartBlock_EPXCrowdsale[this]) >= (0));
if ((__var_11) >= (__tmp__fundingStartBlock_EPXCrowdsale[this])) {
currentPriceValue_s428 := 8800;
return;
}
}
}
}

implementation checkPrice_EPXCrowdsale__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (currentPriceValue_s428: int)
{
var __var_9: int;
var __var_10: int;
var __var_11: int;
// Non-deterministic value to model block.number
havoc __var_9;
assume ((__var_9) >= (0));
assume ((fundingStartBlock_EPXCrowdsale[this]) >= (0));
assume (((fundingStartBlock_EPXCrowdsale[this]) + (177534)) >= (0));
if ((__var_9) >= ((fundingStartBlock_EPXCrowdsale[this]) + (177534))) {
currentPriceValue_s428 := 7600;
return;
} else {
// Non-deterministic value to model block.number
havoc __var_10;
assume ((__var_10) >= (0));
assume ((fundingStartBlock_EPXCrowdsale[this]) >= (0));
assume (((fundingStartBlock_EPXCrowdsale[this]) + (124274)) >= (0));
if ((__var_10) >= ((fundingStartBlock_EPXCrowdsale[this]) + (124274))) {
currentPriceValue_s428 := 8200;
return;
} else {
// Non-deterministic value to model block.number
havoc __var_11;
assume ((__var_11) >= (0));
assume ((fundingStartBlock_EPXCrowdsale[this]) >= (0));
if ((__var_11) >= (fundingStartBlock_EPXCrowdsale[this])) {
currentPriceValue_s428 := 8800;
return;
}
}
}
}

implementation FallbackMethod_EPXCrowdsale__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// ---- Logic for payable function START 
assume ((__tmp__Balance[msgsender_MSG]) >= (msgvalue_MSG));
__tmp__Balance[msgsender_MSG] := (__tmp__Balance[msgsender_MSG]) - (msgvalue_MSG);
__tmp__Balance[this] := (__tmp__Balance[this]) + (msgvalue_MSG);
// ---- Logic for payable function END 
call buy_EPXCrowdsale__fail(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
}

implementation FallbackMethod_EPXCrowdsale__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// ---- Logic for payable function START 
assume ((Balance[msgsender_MSG]) >= (msgvalue_MSG));
Balance[msgsender_MSG] := (Balance[msgsender_MSG]) - (msgvalue_MSG);
Balance[this] := (Balance[this]) + (msgvalue_MSG);
// ---- Logic for payable function END 
call buy_EPXCrowdsale__success(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
}

implementation buy_EPXCrowdsale__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __var_12: int;
var __var_13: int;
var rewardTransferAmount_s526: int;
var __var_14: int;
var __var_15: int;
var __var_16: int;
var __var_17: int;
var __var_18: bool;
var __var_19: int;
var __var_20: int;
// ---- Logic for payable function START 
assume ((__tmp__Balance[msgsender_MSG]) >= (msgvalue_MSG));
__tmp__Balance[msgsender_MSG] := (__tmp__Balance[msgsender_MSG]) - (msgvalue_MSG);
__tmp__Balance[this] := (__tmp__Balance[this]) + (msgvalue_MSG);
// ---- Logic for payable function END 
assume ((msgvalue_MSG) >= (0));
// Non-deterministic value to model block.number
havoc __var_12;
assume ((__var_12) >= (0));
assume ((__tmp__fundingEndBlock_EPXCrowdsale[this]) >= (0));
// Non-deterministic value to model block.number
havoc __var_13;
assume ((__var_13) >= (0));
assume ((__tmp__fundingStartBlock_EPXCrowdsale[this]) >= (0));
assume ((__tmp__tokensRemaining_EPXCrowdsale[this]) >= (0));
if (!((((!(((msgvalue_MSG) == (0)))) && (((__var_12) <= (__tmp__fundingEndBlock_EPXCrowdsale[this])))) && (((__var_13) >= (__tmp__fundingStartBlock_EPXCrowdsale[this])))) && (((__tmp__tokensRemaining_EPXCrowdsale[this]) > (0))))) {
revert := true;
return;
}
assume ((rewardTransferAmount_s526) >= (0));
rewardTransferAmount_s526 := 0;
assume ((__tmp__amountRaisedInWei_EPXCrowdsale[this]) >= (0));
assume ((__tmp__amountRaisedInWei_EPXCrowdsale[this]) >= (0));
assume ((msgvalue_MSG) >= (0));
if ((__tmp__DType[this]) == (EPXCrowdsale)) {
call __var_14 := safeAdd_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, __tmp__amountRaisedInWei_EPXCrowdsale[this], msgvalue_MSG);
if (revert) {
return;
}
} else {
assume (false);
}
__tmp__amountRaisedInWei_EPXCrowdsale[this] := __var_14;
assume ((__var_14) >= (0));
assume ((rewardTransferAmount_s526) >= (0));
assume ((__var_15) >= (0));
assume ((msgvalue_MSG) >= (0));
assume ((__var_16) >= (0));
call __var_16 := checkPrice_EPXCrowdsale__fail(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
assume ((__var_16) >= (0));
if ((__tmp__DType[this]) == (EPXCrowdsale)) {
call __var_15 := safeMul_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, msgvalue_MSG, __var_16);
if (revert) {
return;
}
} else {
assume (false);
}
assume (((__var_15)) >= (0));
assume (((((__var_15)) / (100000000000000))) >= (0));
rewardTransferAmount_s526 := (((__var_15)) / (100000000000000));
assume ((__tmp__tokensRemaining_EPXCrowdsale[this]) >= (0));
assume ((__tmp__tokensRemaining_EPXCrowdsale[this]) >= (0));
assume ((rewardTransferAmount_s526) >= (0));
if ((__tmp__DType[this]) == (EPXCrowdsale)) {
call __var_17 := safeSub_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, __tmp__tokensRemaining_EPXCrowdsale[this], rewardTransferAmount_s526);
if (revert) {
return;
}
} else {
assume (false);
}
__tmp__tokensRemaining_EPXCrowdsale[this] := __var_17;
assume ((__var_17) >= (0));
assume ((rewardTransferAmount_s526) >= (0));
call __var_18 := transfer_StandardToken(__tmp__tokenReward_EPXCrowdsale[this], this, __var_19, msgsender_MSG, rewardTransferAmount_s526);
assume ((__tmp__M_Ref_int[__tmp__usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG]) >= (0));
assume ((__tmp__M_Ref_int[__tmp__usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG]) >= (0));
assume ((msgvalue_MSG) >= (0));
if ((__tmp__DType[this]) == (EPXCrowdsale)) {
call __var_20 := safeAdd_safeMath__fail(this, msgsender_MSG, msgvalue_MSG, __tmp__M_Ref_int[__tmp__usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG], msgvalue_MSG);
if (revert) {
return;
}
} else {
assume (false);
}
__tmp__sum[__tmp__usersEPXfundValue_EPXCrowdsale[this]] := (__tmp__sum[__tmp__usersEPXfundValue_EPXCrowdsale[this]]) - (__tmp__M_Ref_int[__tmp__usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG]);
__tmp__M_Ref_int[__tmp__usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG] := __var_20;
__tmp__sum[__tmp__usersEPXfundValue_EPXCrowdsale[this]] := (__tmp__sum[__tmp__usersEPXfundValue_EPXCrowdsale[this]]) + (__tmp__M_Ref_int[__tmp__usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG]);
assume ((__var_20) >= (0));
}

implementation buy_EPXCrowdsale__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __var_12: int;
var __var_13: int;
var rewardTransferAmount_s526: int;
var __var_14: int;
var __var_15: int;
var __var_16: int;
var __var_17: int;
var __var_18: bool;
var __var_19: int;
var __var_20: int;
// ---- Logic for payable function START 
assume ((Balance[msgsender_MSG]) >= (msgvalue_MSG));
Balance[msgsender_MSG] := (Balance[msgsender_MSG]) - (msgvalue_MSG);
Balance[this] := (Balance[this]) + (msgvalue_MSG);
// ---- Logic for payable function END 
assume ((msgvalue_MSG) >= (0));
// Non-deterministic value to model block.number
havoc __var_12;
assume ((__var_12) >= (0));
assume ((fundingEndBlock_EPXCrowdsale[this]) >= (0));
// Non-deterministic value to model block.number
havoc __var_13;
assume ((__var_13) >= (0));
assume ((fundingStartBlock_EPXCrowdsale[this]) >= (0));
assume ((tokensRemaining_EPXCrowdsale[this]) >= (0));
if (!((((!(((msgvalue_MSG) == (0)))) && (((__var_12) <= (fundingEndBlock_EPXCrowdsale[this])))) && (((__var_13) >= (fundingStartBlock_EPXCrowdsale[this])))) && (((tokensRemaining_EPXCrowdsale[this]) > (0))))) {
revert := true;
return;
}
assume ((rewardTransferAmount_s526) >= (0));
rewardTransferAmount_s526 := 0;
assume ((amountRaisedInWei_EPXCrowdsale[this]) >= (0));
assume ((amountRaisedInWei_EPXCrowdsale[this]) >= (0));
assume ((msgvalue_MSG) >= (0));
if ((DType[this]) == (EPXCrowdsale)) {
call __var_14 := safeAdd_safeMath__success(this, msgsender_MSG, msgvalue_MSG, amountRaisedInWei_EPXCrowdsale[this], msgvalue_MSG);
if (revert) {
return;
}
} else {
assume (false);
}
amountRaisedInWei_EPXCrowdsale[this] := __var_14;
assume ((__var_14) >= (0));
assume ((rewardTransferAmount_s526) >= (0));
assume ((__var_15) >= (0));
assume ((msgvalue_MSG) >= (0));
assume ((__var_16) >= (0));
call __var_16 := checkPrice_EPXCrowdsale__success(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
assume ((__var_16) >= (0));
if ((DType[this]) == (EPXCrowdsale)) {
call __var_15 := safeMul_safeMath__success(this, msgsender_MSG, msgvalue_MSG, msgvalue_MSG, __var_16);
if (revert) {
return;
}
} else {
assume (false);
}
assume (((__var_15)) >= (0));
assume (((((__var_15)) / (100000000000000))) >= (0));
rewardTransferAmount_s526 := (((__var_15)) / (100000000000000));
assume ((tokensRemaining_EPXCrowdsale[this]) >= (0));
assume ((tokensRemaining_EPXCrowdsale[this]) >= (0));
assume ((rewardTransferAmount_s526) >= (0));
if ((DType[this]) == (EPXCrowdsale)) {
call __var_17 := safeSub_safeMath__success(this, msgsender_MSG, msgvalue_MSG, tokensRemaining_EPXCrowdsale[this], rewardTransferAmount_s526);
if (revert) {
return;
}
} else {
assume (false);
}
tokensRemaining_EPXCrowdsale[this] := __var_17;
assume ((__var_17) >= (0));
assume ((rewardTransferAmount_s526) >= (0));
call __var_18 := transfer_StandardToken(tokenReward_EPXCrowdsale[this], this, __var_19, msgsender_MSG, rewardTransferAmount_s526);
assume ((M_Ref_int[usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG]) >= (0));
assume ((M_Ref_int[usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG]) >= (0));
assume ((msgvalue_MSG) >= (0));
if ((DType[this]) == (EPXCrowdsale)) {
call __var_20 := safeAdd_safeMath__success(this, msgsender_MSG, msgvalue_MSG, M_Ref_int[usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG], msgvalue_MSG);
if (revert) {
return;
}
} else {
assume (false);
}
sum[usersEPXfundValue_EPXCrowdsale[this]] := (sum[usersEPXfundValue_EPXCrowdsale[this]]) - (M_Ref_int[usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG]);
M_Ref_int[usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG] := __var_20;
sum[usersEPXfundValue_EPXCrowdsale[this]] := (sum[usersEPXfundValue_EPXCrowdsale[this]]) + (M_Ref_int[usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG]);
assume ((__var_20) >= (0));
assert {:EventEmitted "Buy_EPXCrowdsale"} (true);
}

implementation beneficiaryMultiSigWithdraw_EPXCrowdsale__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _amount_s558: int)
{
var __var_21: int;
var __var_22: bool;
call onlyOwner_pre__fail(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
assume ((__tmp__amountRaisedInWei_EPXCrowdsale[this]) >= (0));
assume ((__tmp__fundingMinCapInWei_EPXCrowdsale[this]) >= (0));
if (!((__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale[this]) && (((__tmp__amountRaisedInWei_EPXCrowdsale[this]) >= (__tmp__fundingMinCapInWei_EPXCrowdsale[this]))))) {
revert := true;
return;
}
__var_21 := gas;
if ((gas) > (2300)) {
gas := 2300;
}
__var_21 := (__var_21) - (gas);
assume ((_amount_s558) >= (0));
call __var_22 := send__fail(this, __tmp__beneficiaryWallet_EPXCrowdsale[this], _amount_s558);
if (!(__var_22)) {
revert := true;
return;
}
gas := (__var_21) + (gas);
}

implementation beneficiaryMultiSigWithdraw_EPXCrowdsale__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _amount_s558: int)
{
var __var_21: int;
var __var_22: bool;
call onlyOwner_pre__success(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
assume ((amountRaisedInWei_EPXCrowdsale[this]) >= (0));
assume ((fundingMinCapInWei_EPXCrowdsale[this]) >= (0));
if (!((areFundsReleasedToBeneficiary_EPXCrowdsale[this]) && (((amountRaisedInWei_EPXCrowdsale[this]) >= (fundingMinCapInWei_EPXCrowdsale[this]))))) {
revert := true;
return;
}
__var_21 := gas;
if ((gas) > (2300)) {
gas := 2300;
}
__var_21 := (__var_21) - (gas);
assume ((_amount_s558) >= (0));
call __var_22 := send__success(this, beneficiaryWallet_EPXCrowdsale[this], _amount_s558);
if (!(__var_22)) {
revert := true;
return;
}
gas := (__var_21) + (gas);
assert {:EventEmitted "Transfer_EPXCrowdsale"} (true);
}

implementation checkGoalReached_EPXCrowdsale__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __var_23: int;
var __var_24: int;
var __var_25: int;
var __var_26: int;
var __var_27: int;
var __var_28: int;
call onlyOwner_pre__fail(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
if (!(__tmp__isCrowdSaleSetup_EPXCrowdsale[this])) {
revert := true;
return;
}
assume ((__tmp__amountRaisedInWei_EPXCrowdsale[this]) >= (0));
assume ((__tmp__fundingMinCapInWei_EPXCrowdsale[this]) >= (0));
// Non-deterministic value to model block.number
havoc __var_23;
assume ((__var_23) >= (0));
assume ((__tmp__fundingEndBlock_EPXCrowdsale[this]) >= (0));
// Non-deterministic value to model block.number
havoc __var_24;
assume ((__var_24) >= (0));
assume ((__tmp__fundingStartBlock_EPXCrowdsale[this]) >= (0));
if ((((__tmp__amountRaisedInWei_EPXCrowdsale[this]) < (__tmp__fundingMinCapInWei_EPXCrowdsale[this]))) && ((((__var_23) <= (__tmp__fundingEndBlock_EPXCrowdsale[this])) && ((__var_24) >= (__tmp__fundingStartBlock_EPXCrowdsale[this]))))) {
__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale[this] := false;
__tmp__isCrowdSaleClosed_EPXCrowdsale[this] := false;
__tmp__CurrentStatus_EPXCrowdsale[this] := -1709220565;
} else {
assume ((__tmp__amountRaisedInWei_EPXCrowdsale[this]) >= (0));
assume ((__tmp__fundingMinCapInWei_EPXCrowdsale[this]) >= (0));
// Non-deterministic value to model block.number
havoc __var_25;
assume ((__var_25) >= (0));
assume ((__tmp__fundingStartBlock_EPXCrowdsale[this]) >= (0));
if ((((__tmp__amountRaisedInWei_EPXCrowdsale[this]) < (__tmp__fundingMinCapInWei_EPXCrowdsale[this]))) && (((__var_25) < (__tmp__fundingStartBlock_EPXCrowdsale[this])))) {
__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale[this] := false;
__tmp__isCrowdSaleClosed_EPXCrowdsale[this] := false;
__tmp__CurrentStatus_EPXCrowdsale[this] := 1119182379;
} else {
assume ((__tmp__amountRaisedInWei_EPXCrowdsale[this]) >= (0));
assume ((__tmp__fundingMinCapInWei_EPXCrowdsale[this]) >= (0));
// Non-deterministic value to model block.number
havoc __var_26;
assume ((__var_26) >= (0));
assume ((__tmp__fundingEndBlock_EPXCrowdsale[this]) >= (0));
if ((((__tmp__amountRaisedInWei_EPXCrowdsale[this]) < (__tmp__fundingMinCapInWei_EPXCrowdsale[this]))) && (((__var_26) > (__tmp__fundingEndBlock_EPXCrowdsale[this])))) {
__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale[this] := false;
__tmp__isCrowdSaleClosed_EPXCrowdsale[this] := true;
__tmp__CurrentStatus_EPXCrowdsale[this] := -2023790500;
} else {
assume ((__tmp__amountRaisedInWei_EPXCrowdsale[this]) >= (0));
assume ((__tmp__fundingMinCapInWei_EPXCrowdsale[this]) >= (0));
assume ((__tmp__tokensRemaining_EPXCrowdsale[this]) >= (0));
if ((((__tmp__amountRaisedInWei_EPXCrowdsale[this]) >= (__tmp__fundingMinCapInWei_EPXCrowdsale[this]))) && (((__tmp__tokensRemaining_EPXCrowdsale[this]) == (0)))) {
__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale[this] := true;
__tmp__isCrowdSaleClosed_EPXCrowdsale[this] := true;
__tmp__CurrentStatus_EPXCrowdsale[this] := -948820234;
} else {
assume ((__tmp__amountRaisedInWei_EPXCrowdsale[this]) >= (0));
assume ((__tmp__fundingMinCapInWei_EPXCrowdsale[this]) >= (0));
// Non-deterministic value to model block.number
havoc __var_27;
assume ((__var_27) >= (0));
assume ((__tmp__fundingEndBlock_EPXCrowdsale[this]) >= (0));
assume ((__tmp__tokensRemaining_EPXCrowdsale[this]) >= (0));
if (((((__tmp__amountRaisedInWei_EPXCrowdsale[this]) >= (__tmp__fundingMinCapInWei_EPXCrowdsale[this]))) && (((__var_27) > (__tmp__fundingEndBlock_EPXCrowdsale[this])))) && (((__tmp__tokensRemaining_EPXCrowdsale[this]) > (0)))) {
__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale[this] := true;
__tmp__isCrowdSaleClosed_EPXCrowdsale[this] := true;
__tmp__CurrentStatus_EPXCrowdsale[this] := -1081868851;
} else {
assume ((__tmp__amountRaisedInWei_EPXCrowdsale[this]) >= (0));
assume ((__tmp__fundingMinCapInWei_EPXCrowdsale[this]) >= (0));
assume ((__tmp__tokensRemaining_EPXCrowdsale[this]) >= (0));
// Non-deterministic value to model block.number
havoc __var_28;
assume ((__var_28) >= (0));
assume ((__tmp__fundingEndBlock_EPXCrowdsale[this]) >= (0));
if (((((__tmp__amountRaisedInWei_EPXCrowdsale[this]) >= (__tmp__fundingMinCapInWei_EPXCrowdsale[this]))) && (((__tmp__tokensRemaining_EPXCrowdsale[this]) > (0)))) && (((__var_28) <= (__tmp__fundingEndBlock_EPXCrowdsale[this])))) {
__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale[this] := true;
__tmp__isCrowdSaleClosed_EPXCrowdsale[this] := false;
__tmp__CurrentStatus_EPXCrowdsale[this] := -2112758119;
}
}
}
}
}
}
}

implementation checkGoalReached_EPXCrowdsale__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __var_23: int;
var __var_24: int;
var __var_25: int;
var __var_26: int;
var __var_27: int;
var __var_28: int;
call onlyOwner_pre__success(this, msgsender_MSG, msgvalue_MSG);
if (revert) {
return;
}
if (!(isCrowdSaleSetup_EPXCrowdsale[this])) {
revert := true;
return;
}
assume ((amountRaisedInWei_EPXCrowdsale[this]) >= (0));
assume ((fundingMinCapInWei_EPXCrowdsale[this]) >= (0));
// Non-deterministic value to model block.number
havoc __var_23;
assume ((__var_23) >= (0));
assume ((fundingEndBlock_EPXCrowdsale[this]) >= (0));
// Non-deterministic value to model block.number
havoc __var_24;
assume ((__var_24) >= (0));
assume ((fundingStartBlock_EPXCrowdsale[this]) >= (0));
if ((((amountRaisedInWei_EPXCrowdsale[this]) < (fundingMinCapInWei_EPXCrowdsale[this]))) && ((((__var_23) <= (fundingEndBlock_EPXCrowdsale[this])) && ((__var_24) >= (fundingStartBlock_EPXCrowdsale[this]))))) {
areFundsReleasedToBeneficiary_EPXCrowdsale[this] := false;
isCrowdSaleClosed_EPXCrowdsale[this] := false;
CurrentStatus_EPXCrowdsale[this] := -1709220565;
} else {
assume ((amountRaisedInWei_EPXCrowdsale[this]) >= (0));
assume ((fundingMinCapInWei_EPXCrowdsale[this]) >= (0));
// Non-deterministic value to model block.number
havoc __var_25;
assume ((__var_25) >= (0));
assume ((fundingStartBlock_EPXCrowdsale[this]) >= (0));
if ((((amountRaisedInWei_EPXCrowdsale[this]) < (fundingMinCapInWei_EPXCrowdsale[this]))) && (((__var_25) < (fundingStartBlock_EPXCrowdsale[this])))) {
areFundsReleasedToBeneficiary_EPXCrowdsale[this] := false;
isCrowdSaleClosed_EPXCrowdsale[this] := false;
CurrentStatus_EPXCrowdsale[this] := 1119182379;
} else {
assume ((amountRaisedInWei_EPXCrowdsale[this]) >= (0));
assume ((fundingMinCapInWei_EPXCrowdsale[this]) >= (0));
// Non-deterministic value to model block.number
havoc __var_26;
assume ((__var_26) >= (0));
assume ((fundingEndBlock_EPXCrowdsale[this]) >= (0));
if ((((amountRaisedInWei_EPXCrowdsale[this]) < (fundingMinCapInWei_EPXCrowdsale[this]))) && (((__var_26) > (fundingEndBlock_EPXCrowdsale[this])))) {
areFundsReleasedToBeneficiary_EPXCrowdsale[this] := false;
isCrowdSaleClosed_EPXCrowdsale[this] := true;
CurrentStatus_EPXCrowdsale[this] := -2023790500;
} else {
assume ((amountRaisedInWei_EPXCrowdsale[this]) >= (0));
assume ((fundingMinCapInWei_EPXCrowdsale[this]) >= (0));
assume ((tokensRemaining_EPXCrowdsale[this]) >= (0));
if ((((amountRaisedInWei_EPXCrowdsale[this]) >= (fundingMinCapInWei_EPXCrowdsale[this]))) && (((tokensRemaining_EPXCrowdsale[this]) == (0)))) {
areFundsReleasedToBeneficiary_EPXCrowdsale[this] := true;
isCrowdSaleClosed_EPXCrowdsale[this] := true;
CurrentStatus_EPXCrowdsale[this] := -948820234;
} else {
assume ((amountRaisedInWei_EPXCrowdsale[this]) >= (0));
assume ((fundingMinCapInWei_EPXCrowdsale[this]) >= (0));
// Non-deterministic value to model block.number
havoc __var_27;
assume ((__var_27) >= (0));
assume ((fundingEndBlock_EPXCrowdsale[this]) >= (0));
assume ((tokensRemaining_EPXCrowdsale[this]) >= (0));
if (((((amountRaisedInWei_EPXCrowdsale[this]) >= (fundingMinCapInWei_EPXCrowdsale[this]))) && (((__var_27) > (fundingEndBlock_EPXCrowdsale[this])))) && (((tokensRemaining_EPXCrowdsale[this]) > (0)))) {
areFundsReleasedToBeneficiary_EPXCrowdsale[this] := true;
isCrowdSaleClosed_EPXCrowdsale[this] := true;
CurrentStatus_EPXCrowdsale[this] := -1081868851;
} else {
assume ((amountRaisedInWei_EPXCrowdsale[this]) >= (0));
assume ((fundingMinCapInWei_EPXCrowdsale[this]) >= (0));
assume ((tokensRemaining_EPXCrowdsale[this]) >= (0));
// Non-deterministic value to model block.number
havoc __var_28;
assume ((__var_28) >= (0));
assume ((fundingEndBlock_EPXCrowdsale[this]) >= (0));
if (((((amountRaisedInWei_EPXCrowdsale[this]) >= (fundingMinCapInWei_EPXCrowdsale[this]))) && (((tokensRemaining_EPXCrowdsale[this]) > (0)))) && (((__var_28) <= (fundingEndBlock_EPXCrowdsale[this])))) {
areFundsReleasedToBeneficiary_EPXCrowdsale[this] := true;
isCrowdSaleClosed_EPXCrowdsale[this] := false;
CurrentStatus_EPXCrowdsale[this] := -2112758119;
}
}
}
}
}
}
}

implementation refund_EPXCrowdsale__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __var_29: int;
var ethRefund_s797: int;
var __var_30: int;
var __var_31: bool;
assume ((__tmp__amountRaisedInWei_EPXCrowdsale[this]) >= (0));
assume ((__tmp__fundingMinCapInWei_EPXCrowdsale[this]) >= (0));
// Non-deterministic value to model block.number
havoc __var_29;
assume ((__var_29) >= (0));
assume ((__tmp__fundingEndBlock_EPXCrowdsale[this]) >= (0));
assume ((__tmp__M_Ref_int[__tmp__usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG]) >= (0));
if (!((((((__tmp__amountRaisedInWei_EPXCrowdsale[this]) < (__tmp__fundingMinCapInWei_EPXCrowdsale[this]))) && ((__tmp__isCrowdSaleClosed_EPXCrowdsale[this]))) && (((__var_29) > (__tmp__fundingEndBlock_EPXCrowdsale[this])))) && (((__tmp__M_Ref_int[__tmp__usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG]) > (0))))) {
revert := true;
return;
}
assume ((ethRefund_s797) >= (0));
assume ((__tmp__M_Ref_int[__tmp__usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG]) >= (0));
ethRefund_s797 := __tmp__M_Ref_int[__tmp__usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG];
assume ((__tmp__M_Ref_int[__tmp__balancesArray_EPXCrowdsale[this]][msgsender_MSG]) >= (0));
__tmp__sum[__tmp__balancesArray_EPXCrowdsale[this]] := (__tmp__sum[__tmp__balancesArray_EPXCrowdsale[this]]) - (__tmp__M_Ref_int[__tmp__balancesArray_EPXCrowdsale[this]][msgsender_MSG]);
__tmp__M_Ref_int[__tmp__balancesArray_EPXCrowdsale[this]][msgsender_MSG] := 0;
__tmp__sum[__tmp__balancesArray_EPXCrowdsale[this]] := (__tmp__sum[__tmp__balancesArray_EPXCrowdsale[this]]) + (__tmp__M_Ref_int[__tmp__balancesArray_EPXCrowdsale[this]][msgsender_MSG]);
assume ((__tmp__M_Ref_int[__tmp__usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG]) >= (0));
__tmp__sum[__tmp__usersEPXfundValue_EPXCrowdsale[this]] := (__tmp__sum[__tmp__usersEPXfundValue_EPXCrowdsale[this]]) - (__tmp__M_Ref_int[__tmp__usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG]);
__tmp__M_Ref_int[__tmp__usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG] := 0;
__tmp__sum[__tmp__usersEPXfundValue_EPXCrowdsale[this]] := (__tmp__sum[__tmp__usersEPXfundValue_EPXCrowdsale[this]]) + (__tmp__M_Ref_int[__tmp__usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG]);
__var_30 := gas;
if ((gas) > (2300)) {
gas := 2300;
}
__var_30 := (__var_30) - (gas);
assume ((ethRefund_s797) >= (0));
call __var_31 := send__fail(this, msgsender_MSG, ethRefund_s797);
if (!(__var_31)) {
revert := true;
return;
}
gas := (__var_30) + (gas);
}

implementation refund_EPXCrowdsale__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __var_29: int;
var ethRefund_s797: int;
var __var_30: int;
var __var_31: bool;
assume ((amountRaisedInWei_EPXCrowdsale[this]) >= (0));
assume ((fundingMinCapInWei_EPXCrowdsale[this]) >= (0));
// Non-deterministic value to model block.number
havoc __var_29;
assume ((__var_29) >= (0));
assume ((fundingEndBlock_EPXCrowdsale[this]) >= (0));
assume ((M_Ref_int[usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG]) >= (0));
if (!((((((amountRaisedInWei_EPXCrowdsale[this]) < (fundingMinCapInWei_EPXCrowdsale[this]))) && ((isCrowdSaleClosed_EPXCrowdsale[this]))) && (((__var_29) > (fundingEndBlock_EPXCrowdsale[this])))) && (((M_Ref_int[usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG]) > (0))))) {
revert := true;
return;
}
assume ((ethRefund_s797) >= (0));
assume ((M_Ref_int[usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG]) >= (0));
ethRefund_s797 := M_Ref_int[usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG];
assume ((M_Ref_int[balancesArray_EPXCrowdsale[this]][msgsender_MSG]) >= (0));
sum[balancesArray_EPXCrowdsale[this]] := (sum[balancesArray_EPXCrowdsale[this]]) - (M_Ref_int[balancesArray_EPXCrowdsale[this]][msgsender_MSG]);
M_Ref_int[balancesArray_EPXCrowdsale[this]][msgsender_MSG] := 0;
sum[balancesArray_EPXCrowdsale[this]] := (sum[balancesArray_EPXCrowdsale[this]]) + (M_Ref_int[balancesArray_EPXCrowdsale[this]][msgsender_MSG]);
assume ((M_Ref_int[usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG]) >= (0));
sum[usersEPXfundValue_EPXCrowdsale[this]] := (sum[usersEPXfundValue_EPXCrowdsale[this]]) - (M_Ref_int[usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG]);
M_Ref_int[usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG] := 0;
sum[usersEPXfundValue_EPXCrowdsale[this]] := (sum[usersEPXfundValue_EPXCrowdsale[this]]) + (M_Ref_int[usersEPXfundValue_EPXCrowdsale[this]][msgsender_MSG]);
assert {:EventEmitted "Burn_EPXCrowdsale"} (true);
__var_30 := gas;
if ((gas) > (2300)) {
gas := 2300;
}
__var_30 := (__var_30) - (gas);
assume ((ethRefund_s797) >= (0));
call __var_31 := send__success(this, msgsender_MSG, ethRefund_s797);
if (!(__var_31)) {
revert := true;
return;
}
gas := (__var_30) + (gas);
assert {:EventEmitted "Refund_EPXCrowdsale"} (true);
}

implementation FallbackDispatch__fail(from: Ref, to: Ref, amount: int)
{
if ((__tmp__DType[to]) == (EPXCrowdsale)) {
call FallbackMethod_EPXCrowdsale__fail(to, from, amount);
if (revert) {
return;
}
} else if ((__tmp__DType[to]) == (StandardToken)) {
assume ((amount) == (0));
} else if ((__tmp__DType[to]) == (safeMath)) {
assume ((amount) == (0));
} else if ((__tmp__DType[to]) == (owned)) {
assume ((amount) == (0));
} else {
call Fallback_UnknownType__fail(from, to, amount);
if (revert) {
return;
}
}
}

implementation FallbackDispatch__success(from: Ref, to: Ref, amount: int)
{
if ((DType[to]) == (EPXCrowdsale)) {
call FallbackMethod_EPXCrowdsale__success(to, from, amount);
if (revert) {
return;
}
} else if ((DType[to]) == (StandardToken)) {
assume ((amount) == (0));
} else if ((DType[to]) == (safeMath)) {
assume ((amount) == (0));
} else if ((DType[to]) == (owned)) {
assume ((amount) == (0));
} else {
call Fallback_UnknownType__success(from, to, amount);
if (revert) {
return;
}
}
}

implementation Fallback_UnknownType__fail(from: Ref, to: Ref, amount: int)
{
// ---- Logic for payable function START 
assume ((__tmp__Balance[from]) >= (amount));
__tmp__Balance[from] := (__tmp__Balance[from]) - (amount);
__tmp__Balance[to] := (__tmp__Balance[to]) + (amount);
// ---- Logic for payable function END 
}

implementation Fallback_UnknownType__success(from: Ref, to: Ref, amount: int)
{
// ---- Logic for payable function START 
assume ((Balance[from]) >= (amount));
Balance[from] := (Balance[from]) - (amount);
Balance[to] := (Balance[to]) + (amount);
// ---- Logic for payable function END 
}

implementation send__fail(from: Ref, to: Ref, amount: int) returns (success: bool)
{
var __exception: bool;
var __snap___tmp__Balance: [Ref]int;
var __snap___tmp__DType: [Ref]ContractName;
var __snap___tmp__Alloc: [Ref]bool;
var __snap___tmp__balance_ADDR: [Ref]int;
var __snap___tmp__M_Ref_int: [Ref][Ref]int;
var __snap___tmp__sum: [Ref]int;
var __snap___tmp__Length: [Ref]int;
var __snap___tmp__now: int;
var __snap___tmp__owner_owned: [Ref]Ref;
var __snap___tmp__admin_EPXCrowdsale: [Ref]Ref;
var __snap___tmp__tokenReward_EPXCrowdsale: [Ref]Ref;
var __snap___tmp__initialTokenSupply_EPXCrowdsale: [Ref]int;
var __snap___tmp__tokensRemaining_EPXCrowdsale: [Ref]int;
var __snap___tmp__beneficiaryWallet_EPXCrowdsale: [Ref]Ref;
var __snap___tmp__amountRaisedInWei_EPXCrowdsale: [Ref]int;
var __snap___tmp__fundingMinCapInWei_EPXCrowdsale: [Ref]int;
var __snap___tmp__CurrentStatus_EPXCrowdsale: [Ref]int;
var __snap___tmp__fundingStartBlock_EPXCrowdsale: [Ref]int;
var __snap___tmp__fundingEndBlock_EPXCrowdsale: [Ref]int;
var __snap___tmp__isCrowdSaleClosed_EPXCrowdsale: [Ref]bool;
var __snap___tmp__areFundsReleasedToBeneficiary_EPXCrowdsale: [Ref]bool;
var __snap___tmp__isCrowdSaleSetup_EPXCrowdsale: [Ref]bool;
var __snap___tmp__balancesArray_EPXCrowdsale: [Ref]Ref;
var __snap___tmp__usersEPXfundValue_EPXCrowdsale: [Ref]Ref;
havoc __exception;
if (__exception) {
__snap___tmp__Balance := __tmp__Balance;
__snap___tmp__DType := __tmp__DType;
__snap___tmp__Alloc := __tmp__Alloc;
__snap___tmp__balance_ADDR := __tmp__balance_ADDR;
__snap___tmp__M_Ref_int := __tmp__M_Ref_int;
__snap___tmp__sum := __tmp__sum;
__snap___tmp__Length := __tmp__Length;
__snap___tmp__now := __tmp__now;
__snap___tmp__owner_owned := __tmp__owner_owned;
__snap___tmp__admin_EPXCrowdsale := __tmp__admin_EPXCrowdsale;
__snap___tmp__tokenReward_EPXCrowdsale := __tmp__tokenReward_EPXCrowdsale;
__snap___tmp__initialTokenSupply_EPXCrowdsale := __tmp__initialTokenSupply_EPXCrowdsale;
__snap___tmp__tokensRemaining_EPXCrowdsale := __tmp__tokensRemaining_EPXCrowdsale;
__snap___tmp__beneficiaryWallet_EPXCrowdsale := __tmp__beneficiaryWallet_EPXCrowdsale;
__snap___tmp__amountRaisedInWei_EPXCrowdsale := __tmp__amountRaisedInWei_EPXCrowdsale;
__snap___tmp__fundingMinCapInWei_EPXCrowdsale := __tmp__fundingMinCapInWei_EPXCrowdsale;
__snap___tmp__CurrentStatus_EPXCrowdsale := __tmp__CurrentStatus_EPXCrowdsale;
__snap___tmp__fundingStartBlock_EPXCrowdsale := __tmp__fundingStartBlock_EPXCrowdsale;
__snap___tmp__fundingEndBlock_EPXCrowdsale := __tmp__fundingEndBlock_EPXCrowdsale;
__snap___tmp__isCrowdSaleClosed_EPXCrowdsale := __tmp__isCrowdSaleClosed_EPXCrowdsale;
__snap___tmp__areFundsReleasedToBeneficiary_EPXCrowdsale := __tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
__snap___tmp__isCrowdSaleSetup_EPXCrowdsale := __tmp__isCrowdSaleSetup_EPXCrowdsale;
__snap___tmp__balancesArray_EPXCrowdsale := __tmp__balancesArray_EPXCrowdsale;
__snap___tmp__usersEPXfundValue_EPXCrowdsale := __tmp__usersEPXfundValue_EPXCrowdsale;
if ((__tmp__Balance[from]) >= (amount)) {
call FallbackDispatch__fail(from, to, amount);
}
success := false;
assume ((revert) || ((gas) < (0)));
__tmp__Balance := __snap___tmp__Balance;
__tmp__DType := __snap___tmp__DType;
__tmp__Alloc := __snap___tmp__Alloc;
__tmp__balance_ADDR := __snap___tmp__balance_ADDR;
__tmp__M_Ref_int := __snap___tmp__M_Ref_int;
__tmp__sum := __snap___tmp__sum;
__tmp__Length := __snap___tmp__Length;
__tmp__now := __snap___tmp__now;
__tmp__owner_owned := __snap___tmp__owner_owned;
__tmp__admin_EPXCrowdsale := __snap___tmp__admin_EPXCrowdsale;
__tmp__tokenReward_EPXCrowdsale := __snap___tmp__tokenReward_EPXCrowdsale;
__tmp__initialTokenSupply_EPXCrowdsale := __snap___tmp__initialTokenSupply_EPXCrowdsale;
__tmp__tokensRemaining_EPXCrowdsale := __snap___tmp__tokensRemaining_EPXCrowdsale;
__tmp__beneficiaryWallet_EPXCrowdsale := __snap___tmp__beneficiaryWallet_EPXCrowdsale;
__tmp__amountRaisedInWei_EPXCrowdsale := __snap___tmp__amountRaisedInWei_EPXCrowdsale;
__tmp__fundingMinCapInWei_EPXCrowdsale := __snap___tmp__fundingMinCapInWei_EPXCrowdsale;
__tmp__CurrentStatus_EPXCrowdsale := __snap___tmp__CurrentStatus_EPXCrowdsale;
__tmp__fundingStartBlock_EPXCrowdsale := __snap___tmp__fundingStartBlock_EPXCrowdsale;
__tmp__fundingEndBlock_EPXCrowdsale := __snap___tmp__fundingEndBlock_EPXCrowdsale;
__tmp__isCrowdSaleClosed_EPXCrowdsale := __snap___tmp__isCrowdSaleClosed_EPXCrowdsale;
__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale := __snap___tmp__areFundsReleasedToBeneficiary_EPXCrowdsale;
__tmp__isCrowdSaleSetup_EPXCrowdsale := __snap___tmp__isCrowdSaleSetup_EPXCrowdsale;
__tmp__balancesArray_EPXCrowdsale := __snap___tmp__balancesArray_EPXCrowdsale;
__tmp__usersEPXfundValue_EPXCrowdsale := __snap___tmp__usersEPXfundValue_EPXCrowdsale;
revert := false;
} else {
if ((__tmp__Balance[from]) >= (amount)) {
call FallbackDispatch__fail(from, to, amount);
success := true;
} else {
success := false;
}
assume ((!(revert)) && ((gas) >= (0)));
}
}

implementation send__success(from: Ref, to: Ref, amount: int) returns (success: bool)
{
var __exception: bool;
havoc __exception;
if (__exception) {
__tmp__Balance := Balance;
__tmp__DType := DType;
__tmp__Alloc := Alloc;
__tmp__balance_ADDR := balance_ADDR;
__tmp__M_Ref_int := M_Ref_int;
__tmp__sum := sum;
__tmp__Length := Length;
__tmp__now := now;
__tmp__owner_owned := owner_owned;
__tmp__admin_EPXCrowdsale := admin_EPXCrowdsale;
__tmp__tokenReward_EPXCrowdsale := tokenReward_EPXCrowdsale;
__tmp__initialTokenSupply_EPXCrowdsale := initialTokenSupply_EPXCrowdsale;
__tmp__tokensRemaining_EPXCrowdsale := tokensRemaining_EPXCrowdsale;
__tmp__beneficiaryWallet_EPXCrowdsale := beneficiaryWallet_EPXCrowdsale;
__tmp__amountRaisedInWei_EPXCrowdsale := amountRaisedInWei_EPXCrowdsale;
__tmp__fundingMinCapInWei_EPXCrowdsale := fundingMinCapInWei_EPXCrowdsale;
__tmp__CurrentStatus_EPXCrowdsale := CurrentStatus_EPXCrowdsale;
__tmp__fundingStartBlock_EPXCrowdsale := fundingStartBlock_EPXCrowdsale;
__tmp__fundingEndBlock_EPXCrowdsale := fundingEndBlock_EPXCrowdsale;
__tmp__isCrowdSaleClosed_EPXCrowdsale := isCrowdSaleClosed_EPXCrowdsale;
__tmp__areFundsReleasedToBeneficiary_EPXCrowdsale := areFundsReleasedToBeneficiary_EPXCrowdsale;
__tmp__isCrowdSaleSetup_EPXCrowdsale := isCrowdSaleSetup_EPXCrowdsale;
__tmp__balancesArray_EPXCrowdsale := balancesArray_EPXCrowdsale;
__tmp__usersEPXfundValue_EPXCrowdsale := usersEPXfundValue_EPXCrowdsale;
if ((__tmp__Balance[from]) >= (amount)) {
call FallbackDispatch__fail(from, to, amount);
}
success := false;
assume ((revert) || ((gas) < (0)));
revert := false;
} else {
if ((Balance[from]) >= (amount)) {
call FallbackDispatch__success(from, to, amount);
success := true;
} else {
success := false;
}
assume ((!(revert)) && ((gas) >= (0)));
}
}

implementation onlyOwner_pre__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
if (!((msgsender_MSG) == (__tmp__owner_owned[this]))) {
revert := true;
return;
}
}

implementation onlyOwner_pre__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
if (!((msgsender_MSG) == (owner_owned[this]))) {
revert := true;
return;
}
}

implementation CorralChoice_owned(this: Ref)
{
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var tmpNow: int;
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc tmpNow;
havoc gas;
assume (((gas) > (4000000)) && ((gas) <= (8000000)));
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (owned));
assume ((DType[msgsender_MSG]) != (safeMath));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (EPXCrowdsale));
Alloc[msgsender_MSG] := true;
}

implementation CorralEntry_owned()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
assume ((null) == (0));
call this := FreshRefGenerator__success();
assume ((now) >= (0));
assume ((((DType[this]) == (owned)) || ((DType[this]) == (StandardToken))) || ((DType[this]) == (EPXCrowdsale)));
gas := (gas) - (53000);
call owned_owned(this, msgsender_MSG, msgvalue_MSG);
assume ((!(revert)) && ((gas) >= (0)));
while (true)
{
call CorralChoice_owned(this);
}
}

implementation CorralChoice_safeMath(this: Ref)
{
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var tmpNow: int;
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc tmpNow;
havoc gas;
assume (((gas) > (4000000)) && ((gas) <= (8000000)));
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (owned));
assume ((DType[msgsender_MSG]) != (safeMath));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (EPXCrowdsale));
Alloc[msgsender_MSG] := true;
}

implementation CorralEntry_safeMath()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
assume ((null) == (0));
call this := FreshRefGenerator__success();
assume ((now) >= (0));
assume ((((DType[this]) == (safeMath)) || ((DType[this]) == (StandardToken))) || ((DType[this]) == (EPXCrowdsale)));
gas := (gas) - (53000);
call safeMath_safeMath__success(this, msgsender_MSG, msgvalue_MSG);
assume ((!(revert)) && ((gas) >= (0)));
while (true)
{
call CorralChoice_safeMath(this);
}
}

implementation CorralChoice_StandardToken(this: Ref)
{
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var who_s162: Ref;
var __ret_0_balanceOf: int;
var to_s171: Ref;
var value_s171: int;
var __ret_0_transfer: bool;
var tmpNow: int;
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc who_s162;
havoc __ret_0_balanceOf;
havoc to_s171;
havoc value_s171;
havoc __ret_0_transfer;
havoc tmpNow;
havoc gas;
assume (((gas) > (4000000)) && ((gas) <= (8000000)));
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (owned));
assume ((DType[msgsender_MSG]) != (safeMath));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (EPXCrowdsale));
Alloc[msgsender_MSG] := true;
if ((choice) == (2)) {
gas := (gas) - (21000);
assume ((msgvalue_MSG) == (0));
call __ret_0_balanceOf := balanceOf_StandardToken(this, msgsender_MSG, msgvalue_MSG, who_s162);
} else if ((choice) == (1)) {
gas := (gas) - (21000);
assume ((msgvalue_MSG) == (0));
call __ret_0_transfer := transfer_StandardToken(this, msgsender_MSG, msgvalue_MSG, to_s171, value_s171);
}
}

implementation CorralEntry_StandardToken()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
assume ((null) == (0));
call this := FreshRefGenerator__success();
assume ((now) >= (0));
assume ((DType[this]) == (StandardToken));
gas := (gas) - (53000);
call StandardToken_StandardToken__success(this, msgsender_MSG, msgvalue_MSG);
assume ((!(revert)) && ((gas) >= (0)));
while (true)
{
call CorralChoice_StandardToken(this);
}
}

implementation CorralChoice_EPXCrowdsale(this: Ref)
{
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var initialEPXtokenCount_s286: int;
var remainingEPXtokenCount_s299: int;
var _fundingStartBlock_s391: int;
var _fundingEndBlock_s391: int;
var response_s391: int;
var _amount_s558: int;
var who_s162: Ref;
var __ret_0_balanceOf: int;
var to_s171: Ref;
var value_s171: int;
var __ret_0_transfer: bool;
var tmpNow: int;
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc initialEPXtokenCount_s286;
havoc remainingEPXtokenCount_s299;
havoc _fundingStartBlock_s391;
havoc _fundingEndBlock_s391;
havoc response_s391;
havoc _amount_s558;
havoc who_s162;
havoc __ret_0_balanceOf;
havoc to_s171;
havoc value_s171;
havoc __ret_0_transfer;
havoc tmpNow;
havoc gas;
assume (((gas) > (4000000)) && ((gas) <= (8000000)));
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (owned));
assume ((DType[msgsender_MSG]) != (safeMath));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (EPXCrowdsale));
Alloc[msgsender_MSG] := true;
if ((choice) == (9)) {
gas := (gas) - (21000);
assume ((msgvalue_MSG) == (0));
call __ret_0_balanceOf := balanceOf_StandardToken(tokenReward_EPXCrowdsale[this], msgsender_MSG, msgvalue_MSG, who_s162);
} else if ((choice) == (8)) {
gas := (gas) - (21000);
assume ((msgvalue_MSG) == (0));
call __ret_0_transfer := transfer_StandardToken(tokenReward_EPXCrowdsale[this], msgsender_MSG, msgvalue_MSG, to_s171, value_s171);
} else if ((choice) == (7)) {
gas := (gas) - (21000);
assume ((msgvalue_MSG) == (0));
call initialEPXtokenCount_s286 := initialEPXSupply_EPXCrowdsale(this, msgsender_MSG, msgvalue_MSG);
} else if ((choice) == (6)) {
gas := (gas) - (21000);
assume ((msgvalue_MSG) == (0));
call remainingEPXtokenCount_s299 := remainingEPXSupply_EPXCrowdsale(this, msgsender_MSG, msgvalue_MSG);
} else if ((choice) == (5)) {
gas := (gas) - (21000);
assume ((msgvalue_MSG) == (0));
call response_s391 := SetupCrowdsale_EPXCrowdsale(this, msgsender_MSG, msgvalue_MSG, _fundingStartBlock_s391, _fundingEndBlock_s391);
} else if ((choice) == (4)) {
gas := (gas) - (21000);
call buy_EPXCrowdsale(this, msgsender_MSG, msgvalue_MSG);
} else if ((choice) == (3)) {
gas := (gas) - (21000);
assume ((msgvalue_MSG) == (0));
call beneficiaryMultiSigWithdraw_EPXCrowdsale(this, msgsender_MSG, msgvalue_MSG, _amount_s558);
} else if ((choice) == (2)) {
gas := (gas) - (21000);
assume ((msgvalue_MSG) == (0));
call checkGoalReached_EPXCrowdsale(this, msgsender_MSG, msgvalue_MSG);
} else if ((choice) == (1)) {
gas := (gas) - (21000);
assume ((msgvalue_MSG) == (0));
call refund_EPXCrowdsale(this, msgsender_MSG, msgvalue_MSG);
}
}

implementation main()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
assume ((null) == (0));
call this := FreshRefGenerator__success();
assume ((now) >= (0));
assume ((DType[this]) == (EPXCrowdsale));
gas := (gas) - (53000);
call EPXCrowdsale_EPXCrowdsale(this, msgsender_MSG, msgvalue_MSG);
assume ((!(revert)) && ((gas) >= (0)));
while (true)
{
call CorralChoice_EPXCrowdsale(this);
}
}


