import React, {Component} from 'react';
import './styles.css';

let transactionData = [];
class TransactionList extends Component {
  constructor(props) {
    super(props)
    this.state = {
      loading: true
    }
  }

  fetchData() {
    fetch('/api/test')
      .then(resp => resp.json())
      .then(data => this.handleData(data))
      .catch(err => console.log("whoops: ", err))
  }

  handleData(data) {
    this.setState(data);
    transactionData = data;
    this.setState({ loading: false });
  }

  async componentWillMount() {
    await this.fetchData();
  }

  checkDomain(item) {
    if (item.domain) {
       return <div className="item-card">
                    <div className="item-head">
                      <img  className="item-logo" src={item.domain.logo} alt={item.domain.name + "-icon"}/>
                      <div className="item-name">{item.domain.name}</div>
                  </div>
                  <div className="item-recurring">Recurring Transaction: {item.recurring.toString()}</div>
                </div>
    }
      else return <div className="item-card fail">
                          <div className="item-name">Domain Not found</div>
                          <div className="item-raw-name">Transaction Name: {item.name}</div>
                          <div className="item-recurring">Recurring Transaction: {item.recurring.toString()}</div>
                        </div>
  }

  buildItem(data) {
   let item = JSON.parse(data);
     return <li key={item.name}>
        <div className="item-container">
         {this.checkDomain(item)}
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
      <div>{Loading}</div>
    )
  }
}

export default TransactionList;