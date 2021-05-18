import EthtoDai from '../abis/EthtoDai.json' 
import Web3 from 'web3'


export const borrow = async (dispatch) => {
    try{
        const web3 = new Web3(Web3.givenProvider || 'http://localhost:7545')
        const network = await web3.eth.net.getNetworkType()
        const networkID = await web3.eth.net.getId()
        await window.ethereum.enable()

        const accounts = await web3.eth.getAccounts()
        const ethtodai = new web3.eth.Contract(EthtoDai.abi, EthtoDai.networks[networkID].address)
        var ethdeposit = await web3.eth.getBalance(accounts[0])
        var daiborrow =  10000
        const amount = web3.utils.fromWei(ethdeposit, 'ether')
        
        console.log(ethtodai)
        console.log(accounts[0])
        console.log(ethdeposit)
        console.log(amount)
        

        await ethtodai.methods.main(ethdeposit, daiborrow).send({from: accounts[0]})
    .on('transactionHash', async (r) => {
        //update(dispatch)
        console.log('success')
      })
      .on('error',(error) => {
        console.error(error)
        window.alert(`There was an error!`)
      })
} catch (e){
      console.log('There was another error!`', e)
    }
}
    