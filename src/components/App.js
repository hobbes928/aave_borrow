import React, { Component } from 'react';
import { borrow } from './interactions'
import './App.css';





class App extends Component {
    componentWillMount() {
      this.loadblockchainData()

  }

  async loadblockchainData() {


      
  }
  



  render() {
    return (
      <div>
        <nav className="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
          <a
            className="navbar-brand col-sm-3 col-md-2 mr-0"
            href="http://www.dappuniversity.com/bootcamp"
            target="_blank"
            rel="noopener noreferrer"
          >
            Dapp University
          </a>
        </nav>

        
        <div className="container-fluid mt-5">
          <div className="row">
            <main role="main" className="col-lg-12 d-flex text-center">
              <div className="content mr-auto ml-auto">
                <h1>Exchange Eth for Dai</h1>
              </div>
            </main>
          </div>
        </div>
        <h2>Eth Balance: </h2>
        <h2>Dai Balance: </h2>
        <button type="submit" className="btn btn-primary btn-sm" onClick={(e) => borrow(this.props.dispatch)}>Borrow</button>
        
            

        
        </div>

        
    );
  }
}



export default App;
