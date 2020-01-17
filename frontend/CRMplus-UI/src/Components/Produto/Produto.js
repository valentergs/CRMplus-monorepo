import React, { Component } from "react";

export class Produto extends Component {
  render() {
    return (
      <div>
        <div className="card my-3">
          <div className="card-header">
            <h4>Produto</h4>
          </div>
          <div className="card-body">Texto</div>
        </div>
      </div>
    );
  }
}

export default Produto;
