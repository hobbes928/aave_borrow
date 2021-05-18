import {tokens} from './helpers'

const EthtoDai = artifacts.require('./EthtoDai')


require('chai')
.use(require('chai-as-promised'))
.should()






contract('EthtoDai', ([user1, user2]) => {
    let ethtodai
    let amount
    let result

beforeEach(async() => {

    ethtodai = await EthtoDai.new()
    amount = tokens(10)
    result = await ethtodai.main(amount, { from: user1})
   
})



describe('success', () => {

    it('confirms user1 address', async() => {
        console.log(result.toString())
    })






})


describe('failure', () => {

    it('reject depositing from an invalid address', async() => {
        console.log(result.toString())
    })






})











})




