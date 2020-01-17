import React from "react";

function Sidebar() {
  return (
    <ul className="list-group" style={{ marginTop: "20px" }}>
      <li className="list-group-item active">Usuario</li>
      <li className="list-group-item">Contato</li>
      <li className="list-group-item">Produto</li>
      <li className="list-group-item">Relatório</li>
      <li className="list-group-item">Forecast</li>
    </ul>
  );
}

export default Sidebar;
