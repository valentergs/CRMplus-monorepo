import React, { useContext, useEffect } from "react";
import { Link } from "react-router-dom";
import CRMplusContext from "../../Context/crmplus/crmplusContext";

const DashBoard = () => {
  const crmplusContext = useContext(CRMplusContext);
  const { usuarioState, getUsuarios } = crmplusContext;

  useEffect(() => {
    getUsuarios();
    // eslint-disable-next-line
  }, []);

  return (
    <div>
      <div className="container">
        <div className="row my-3">
          <div className="col-md-4">
            <div className="card shadow">
              <div className="card-header">
                <Link style={{ textDecoration: "none" }} to="/usuarios">
                  <h3>Usuarios</h3>
                </Link>
              </div>
              <div className="card-body">
                Numero de usuarios: {usuarioState.length}
              </div>
            </div>
          </div>
          <div className="col-md-4">
            <div className="card shadow rounded">
              <div className="card-header">
                <h3>Clientes</h3>
              </div>
              <div className="card-body">Numero de clientes: 0</div>
            </div>
          </div>
          <div className="col-md-4">
            <div className="card shadow rounded">
              <div className="card-header">
                <h3>Relatórios</h3>
              </div>
              <div className="card-body">Numero de relatórios: 0</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default DashBoard;
