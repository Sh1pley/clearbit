import React from 'react';

export default function TransactionDetails(props) {
  let transactions = props.transactions;
  if (transactions.length > 0) {
    return <div className="transactions">
                
                  {transactions.map(tr => {
                    return <ul key={`${tr.date}-${tr.account_id}`}>
                    <li>Date: {tr.date}</li>
                    <li>Amount: {tr.amount}</li>
                    <li>Category: {tr.category.toString()}</li>
                    <li>Pending: {tr.pending.toString()}</li>
                    <li>Type: {tr.type}</li>
                </ul>
                    })}
              </div>
  } else return <div>Please select domain</div>
}