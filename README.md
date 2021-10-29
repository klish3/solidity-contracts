# solidity-contract
Developing Applications on Ethereum Blockchain from pPluralSight using Remix IDE https://remix.ethereum.org/
## Contracts

1. HelloWorld.sol
2. Voter.sol <- Current

### Notes

https://stackoverflow.com/questions/69463898/flag-provided-but-not-defined-rpc

The latest versions of Geth (after 1.10.8-stable) do not support --rpc but fortunately, as you can see in the Command-line Options, it has been replaced by the --http option. So your command should look like this:

geth --datadir ~/etherprivate/ --networkid 786 --http --http.api 'web3,eth,net,debug,personal' --http.corsdomain '*'

With all rpc options replaced by their http equivalent:

--rpc => --http
--rpcapi => --http.api
--rpccorsdomain => --http.corsdomain