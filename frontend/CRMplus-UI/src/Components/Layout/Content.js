import React, { Component } from "react";
import Usuario from "../Usuario/Usuario";
import Cliente from "../Cliente/Cliente";
import Produto from "../Produto/Produto";
import Preco from "../Preco/Preco";

export class Content extends Component {
  render() {
    return (
      <div>
        <div className="container">
          <div className="row">
            <div className="col-md-5">
              <Usuario />
            </div>
            <div className="col-md-7">
              <div className="row">
                <div className="col-md-6">
                  <Cliente />
                </div>
                <div className="col-md-6">
                  <Produto />
                </div>
              </div>
              <div className="row">
                <div className="col-md-6">
                  <Preco />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default Content;
