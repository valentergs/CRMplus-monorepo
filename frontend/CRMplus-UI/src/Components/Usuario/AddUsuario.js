import React, { Component } from "react";

export class AddUsuario extends Component {
  state = {
    nome: "",
    sobrenome: "",
    senha: "",
    email: "",
    celular: "",
    superuser: false,
    ativo: false,
    departamento: ""
  };

  onSubmit = e => {
    e.preventDefault();
    this.props.addUsuario(this.state);
    this.setState({
      nome: "",
      sobrenome: "",
      senha: "",
      email: "",
      celular: "",
      superuser: false,
      ativo: false,
      departamento: ""
    });
  };

  onChange = e => {
    const target = e.target;
    const value = target.type === "checkbox" ? target.checked : target.value;
    const name = target.name;

    this.setState({ [name]: value });
  };

  render() {
    const {
      nome,
      sobrenome,
      senha,
      email,
      celular,
      superuser,
      ativo,
      departamento
    } = this.state;

    return (
      <form onSubmit={this.onSubmit} method="post">
        <div className="form-group">
          <input
            type="text"
            className="form-control"
            placeholder="Nome"
            name="nome"
            value={nome}
            onChange={this.onChange}
          />
        </div>
        <div className="form-group">
          <input
            type="text"
            className="form-control"
            placeholder="Sobrenome"
            name="sobrenome"
            value={sobrenome}
            onChange={this.onChange}
          />
        </div>
        <div className="form-group">
          <input
            type="email"
            className="form-control"
            placeholder="Email"
            name="email"
            value={email}
            onChange={this.onChange}
          />
        </div>
        <div className="form-group">
          <input
            type="password"
            className="form-control"
            placeholder="Senha"
            name="senha"
            value={senha}
            onChange={this.onChange}
          />
          <small id="emailHelp" className="form-text text-muted">
            Sua senha será encriptada em nosso Banco de Dados.
          </small>
        </div>
        <div className="form-group">
          <input
            type="text"
            className="form-control"
            placeholder="Celular"
            name="celular"
            value={celular}
            onChange={this.onChange}
          />
        </div>
        <div className="form-group">
          <select
            type="text"
            className="form-control"
            placeholder="Departamento"
            name="departamento"
            value={departamento}
            onChange={this.onChange}
          >
            <option value="-----">-----</option> />
            <option value="Vendas">Vendas</option>
            <option value="Marketing">Marketing</option>
            <option value="Financeiro">Financeiro</option>
          </select>
        </div>
        <div className="form-group">
          <input
            type="checkbox"
            name="superuser"
            value={superuser}
            onChange={this.onChange}
          />
          <label style={{ marginLeft: "4px" }}>Superuser</label>

          <input
            style={{ marginLeft: "15px" }}
            type="checkbox"
            name="ativo"
            value={ativo}
            onChange={this.onChange}
          />
          <label style={{ marginLeft: "4px" }}>Ativo</label>
        </div>
        <button type="submit" className="btn btn-primary">
          Adicionar
        </button>
      </form>
    );
  }
}

export default AddUsuario;
