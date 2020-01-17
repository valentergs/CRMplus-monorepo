import React, { useEffect, useContext, useState } from "react";
import CRMplusContext from "../../Context/crmplus/crmplusContext";

const UpdateUsuarioForm = () => {
  const crmplusContext = useContext(CRMplusContext);
  const { updateUsuario, current, clearCurrent } = crmplusContext;

  useEffect(() => {
    setUsuario(current);
  }, [crmplusContext, current]);

  const [usuario, setUsuario] = useState({
    nome: "",
    sobrenome: "",
    senha: "",
    email: "",
    celular: "",
    superuser: false,
    ativo: false,
    departamento: ""
  });

  const {
    nome,
    sobrenome,
    email,
    celular,
    superuser,
    ativo,
    departamento
  } = usuario;

  const onChange = e => {
    const target = e.target;
    const name = target.name;
    const value = target.type === "checkbox" ? target.checked : target.value;
    setUsuario({ ...usuario, [name]: value });
  };

  const onSubmit = e => {
    e.preventDefault();
    updateUsuario(usuario);
    clearAll();
  };

  const clearAll = () => {
    clearCurrent();
  };

  return (
    <div>
      <form onSubmit={onSubmit} method="post">
        <h2 className="text-primary">Editar Usuario</h2>
        <div className="form-group">
          <input
            type="text"
            className="form-control"
            placeholder="Nome"
            name="nome"
            value={nome}
            onChange={onChange}
          />
        </div>
        <div className="form-group">
          <input
            type="text"
            className="form-control"
            placeholder="Sobrenome"
            name="sobrenome"
            value={sobrenome}
            onChange={onChange}
          />
        </div>
        <div className="form-group">
          <input
            type="email"
            className="form-control"
            placeholder="Email"
            name="email"
            value={email}
            onChange={onChange}
          />
        </div>
        <div className="form-group">
          <input
            type="text"
            className="form-control"
            placeholder="Celular"
            name="celular"
            value={celular}
            onChange={onChange}
          />
        </div>
        <div className="form-group">
          <select
            type="text"
            className="form-control"
            placeholder="Departamento"
            name="departamento"
            value={departamento}
            onChange={onChange}
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
            checked={superuser}
            onChange={onChange}
          />
          <label style={{ marginLeft: "4px" }}>Superuser</label>

          <input
            style={{ marginLeft: "15px" }}
            type="checkbox"
            name="ativo"
            checked={ativo}
            onChange={onChange}
          />
          <label style={{ marginLeft: "4px" }}>Ativo</label>
        </div>
        <div>
          <input
            type="submit"
            value="Atualizar usuário"
            className="btn btn-primary btn-block"
          />
        </div>
        <div>
          <button
            className="btn btn-warning btn-block"
            style={{ marginTop: "10px" }}
            onClick={clearAll}
          >
            Cancelar
          </button>
        </div>
      </form>
    </div>
  );
};

export default UpdateUsuarioForm;
