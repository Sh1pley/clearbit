import React from 'react';

export default function TransactionItem(props){

let item = props.item
  if (item.domain) {
    return <div className="item-card" onClick={props.onClick}>
                 <div className="item-head">
                   <img  className="item-logo" src={item.domain.logo} alt={item.domain.name + "-icon"}/>
                   <div className="item-name">{item.domain.name}</div>
               </div>
               <div className="item-recurring">Recurring Transaction: {item.recurring.toString()}</div>
             </div>
  }
  else return <div className="item-card fail" onClick={props.onClick}>
                      <div className="item-name">Domain Not found</div>
                      <div className="item-raw-name">Transaction Name: {item.name}</div>
                      <div className="item-recurring">Recurring Transaction: {item.recurring.toString()}</div>
                    </div>
}