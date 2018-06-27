import React from 'react';
import TransactionList from './components/transactionList/TransactionList';

class App extends React.Component {
  render() {
    return (
      <div className="main-container">
        <div className="app-header">
          <h2>List of Transactions</h2>
          <TransactionList />
        </div>
      </div>
    )
  }
}

export default App;