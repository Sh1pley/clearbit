import React, {Component} from 'react';
import TransactionDetails from './TransactionDetails';
import TransactionItem from './TransactionItem';
import './styles.css';

let transactionData = [];
class TransactionList extends Component {
  constructor(props) {
    super(props)
    this.state = {
      loading: true,
      transactions: []
    }
  }

  fetchData() {
    fetch('/api/test')
      .then(resp => resp.json())
      .then(data => this.handleData(data))
      .catch(err => console.log("whoops: ", err))
  }

  handleClick(transactions) {
    this.setState({transactions})
  }

  handleData(data) {
    this.setState(data);
    transactionData = data;
    this.setState({ loading: false });
  }

  async componentWillMount() {
    await this.fetchData();
  }

  buildItem(data) {
   let item = JSON.parse(data);
     return <li key={item.name}>
        <div className="item-container">
         <TransactionItem onClick={() => this.handleClick(item.transactions)} item={item} />
        </div>
      </li>
  }

  render() {
    const Transactions = (data) => {
      return <ul>{data.map( t => this.buildItem(t))}</ul>
    }
    const Loading = !this.state.loading && transactionData.length
      ? <div>Results: {Transactions(transactionData)}</div>
      : <div>Loading ...</div>
    return (
      <div className="transactions-container">
        <div className="transactions-list">{Loading}</div>
        <div className="transaction-detail"><TransactionDetails transactions={this.state.transactions} /></div>
      </div>
    )
  }
}

export default TransactionList;