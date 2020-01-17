import React, { Fragment, useContext, useEffect } from "react";
import UsuarioItem from "./UsuarioItem";
import UsuarioFilter from "./UsuariosFilter";
import AddUsuarioForm from "./AddUsuarioForm";
import UpdateUsuarioForm from "./UpdateUsuarioForm";
import CRMplusContext from "../../Context/crmplus/crmplusContext";

const Usuarios = () => {
  const crmplusContext = useContext(CRMplusContext);
  const { usuarioState, getUsuarios, filtered, current } = crmplusContext;

  useEffect(() => {
    getUsuarios();
    // eslint-disable-next-line
  }, []);

  if (usuarioState !== null && usuarioState.length === 0) {
    return <h4>Please add a contact</h4>;
  }

  return (
    <Fragment>
      <div className="container">
        <div className="row">
          <div className="col-md-7">
            <UsuarioFilter />
            {filtered !== null
              ? filtered.map(usuario => (
                  <div key={usuario.usuario_id}>
                    <UsuarioItem usuario={usuario} />
                  </div>
                ))
              : usuarioState.map(usuario => (
                  <div key={usuario.usuario_id}>
                    <UsuarioItem usuario={usuario} />
                  </div>
                ))}
          </div>
          <div className="col-md-5">
            {current ? <UpdateUsuarioForm /> : <AddUsuarioForm />}
          </div>
        </div>
      </div>
    </Fragment>
  );
};

export default Usuarios;
