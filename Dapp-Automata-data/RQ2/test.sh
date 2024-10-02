
for i in {1..5}
do 
echo "$i round..."

echo "RpsGame" >> ./test_seq_ablationstudy.log
myth -v 2 analyze ./contracts/RpsGame.sol:RpsGame --transaction-sequences "[[0xfe1f6a0b], [0xca6649c5], [0x0aebeb4e]]" --parallel-solving >> ./test_seq_ablationstudy.log 2>&1
myth -v 2 analyze ./contracts/RpsGame_instrument_index.sol:RpsGame --transaction-sequences "[[0xfe1f6a0b], [0xca6649c5], [0x0aebeb4e]]" --parallel-solving >> ./test_seq_ablationstudy.log 2>&1

echo "SaleClockAuction" >> ./test_seq_ablationstudy.log
myth -v 2 analyze ./contracts/SaleClockAuction.sol:SaleClockAuction --transaction-sequences "[[0x961c9ae4], [0x859b97fe]]" --parallel-solving >> ./test_seq_ablationstudy.log 2>&1
myth -v 2 analyze ./contracts/SaleClockAuction_instrument_index.sol:SaleClockAuction --transaction-sequences "[[0x961c9ae4], [0x859b97fe]]" --parallel-solving >> ./test_seq_ablationstudy.log 2>&1


echo "MoonCatRescue" >> ./test_seq_ablationstudy.log
myth -v 2 analyze ./contracts/MoonCatRescue.sol:MoonCatRescue --transaction-sequences "[[0x59ede867], [0x74fe6dea],[0xa4202615], [0x1be70510]]" --parallel-solving >> ./test_seq_ablationstudy.log 2>&1
myth -v 2 analyze ./contracts/MoonCatRescue_instrument_index.sol:MoonCatRescue --transaction-sequences "[[0x59ede867], [0x74fe6dea], [0xa4202615], [0x1be70510]]" --parallel-solving >> ./test_seq_ablationstudy.log 2>&1


echo "CryptoPunksMarket" >> ./test_seq_ablationstudy.log
myth -v 2 analyze ./contracts/CryptoPunksMarket.sol:CryptoPunksMarket --transaction-sequences "[[0x7ecedac9], [0x8b72a2ec],[0xc44193c3],[0x091dbfd2],[0x23165b75]]" --parallel-solving >> ./test_seq_ablationstudy.log 2>&1
myth -v 2 analyze ./contracts/CryptoPunksMarket_instrument_index.sol:CryptoPunksMarket --transaction-sequences "[[0x7ecedac9], [0x8b72a2ec],[0xc44193c3],[0x091dbfd2],[0x23165b75]]" --parallel-solving >> ./test_seq_ablationstudy.log 2>&1

echo "GameChannel" >> ./test_seq_ablationstudy.log
myth -v 2 analyze ./contracts/GameChannel.sol:GameChannel --transaction-sequences "[[0xafc81953], [0x9b29f133],[0xa8182cd3]]" --parallel-solving >> ./test_seq_ablationstudy.log 2>&1
myth -v 2 analyze ./contracts/GameChannel_instrument_index.sol:GameChannel --transaction-sequences "[[0xafc81953], [0x9b29f133],[0xa8182cd3]]" --parallel-solving >> ./test_seq_ablationstudy.log 2>&1

echo "SupeRare" >> ./test_seq_ablationstudy.log
myth -v 2 analyze ./contracts/SupeRare.sol:SupeRare --transaction-sequences "[[0xd9856c21], [0x454a2ab3],[0x2b1fd58a]]" --parallel-solving >> ./test_seq_ablationstudy.log 2>&1
myth -v 2 analyze ./contracts/SupeRare_instrument_index.sol:SupeRare --transaction-sequences "[[0xd9856c21], [0x454a2ab3],[0x2b1fd58a]]" --parallel-solving >> ./test_seq_ablationstudy.log 2>&1

done 