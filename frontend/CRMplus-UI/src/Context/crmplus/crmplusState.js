import React, { useReducer } from "react";
import axios from "axios";
import CrmplusContext from "./crmplusContext";
import CrmplusReducer from "./crmplusReducer";
import {
  ADD_USUARIO,
  GET_USUARIOS,
  DEL_USUARIO,
  UPDATE_USUARIO,
  FILTER_USUARIO,
  CLEAR_FILTER,
  SET_CURRENT,
  CLEAR_CURRENT
} from "../types";

const CrmplusState = props => {
  const initialState = {
    usuarioState: [],
    current: null,
    filtered: null,
    addUsuarioBtn: true,
    toggleAddUsuarioForm: true
  };

  const [state, dispatch] = useReducer(CrmplusReducer, initialState);

  // Get Usuarios
  const getUsuarios = async () => {
    const res = await axios.get("http://localhost:8080/usuario");
    dispatch({
      type: GET_USUARIOS,
      payload: res.data
    });
  };

  // Delete Usuario
  const delUsuario = usuario_id => {
    axios.delete(`http://localhost:8080/usuario/delete/${usuario_id}`);
    dispatch({
      type: DEL_USUARIO,
      payload: usuario_id
    });
  };

  // Add Usuario
  const addUsuario = async usuario => {
    const res = await axios.post("http://localhost:8080/usuario/add", usuario);
    dispatch({
      type: ADD_USUARIO,
      payload: res.data
    });
  };

  // Set current usuário
  const setCurrent = usuario => {
    dispatch({ type: SET_CURRENT, payload: usuario });
  };

  // Clear current usuário
  const clearCurrent = () => {
    dispatch({ type: CLEAR_CURRENT });
  };

  // Update usuário
  const updateUsuario = async usuario => {
    const res = await axios.put(
      `http://localhost:8080/usuario/edit/${usuario.usuario_id}`,
      usuario
    );
    dispatch({ type: UPDATE_USUARIO, payload: res.data });
  };

  // Filter usuário
  const filterUsuario = text => {
    dispatch({ type: FILTER_USUARIO, payload: text });
  };

  // Clear Filter
  const clearFilter = () => {
    dispatch({ type: CLEAR_FILTER });
  };

  return (
    <CrmplusContext.Provider
      value={{
        usuarioState: state.usuarioState,
        filtered: state.filtered,
        current: state.current,
        addUsuarioBtn: state.addUsuarioBtn,
        toggleAddUsuarioForm: state.toggleAddUsuarioForm,
        delUsuario,
        addUsuario,
        getUsuarios,
        filterUsuario,
        clearFilter,
        updateUsuario,
        clearCurrent,
        setCurrent
      }}
    >
      {props.children}
    </CrmplusContext.Provider>
  );
};

export default CrmplusState;
