import {
  DEL_USUARIO,
  ADD_USUARIO,
  FILTER_USUARIO,
  CLEAR_USUARIO,
  GET_USUARIOS,
  SET_CURRENT,
  UPDATE_USUARIO,
  CLEAR_CURRENT
} from "../types";

export default (state, action) => {
  switch (action.type) {
    case GET_USUARIOS:
      return {
        ...state,
        usuarioState: action.payload
      };
    case ADD_USUARIO:
      return {
        ...state,
        usuarioState: [...state.usuarioState, action.payload]
      };
    case DEL_USUARIO:
      return {
        ...state,
        usuarioState: state.usuarioState.filter(
          x => x.usuario_id !== action.payload
        )
      };
    case FILTER_USUARIO:
      return {
        ...state,
        filtered: state.usuarioState.filter(x => {
          const regex = new RegExp(`${action.payload}`, "gi");
          return x.nome.match(regex) || x.sobrenome.match(regex);
        })
      };
    case CLEAR_USUARIO:
      return {
        ...state,
        filtered: null
      };
    case SET_CURRENT:
      return {
        ...state,
        current: action.payload
      };
    case CLEAR_CURRENT:
      return {
        ...state,
        current: null
      };
    case UPDATE_USUARIO:
      return {
        ...state,
        // Poderia usar state.usuarioState.find() no lugar de map()
        usuarioState: state.usuarioState.map(usuario =>
          usuario.usuario_id === action.payload.usuario_id
            ? action.payload
            : usuario
        )
        // usuarioState: [...state.usuarioState, action.payload]
      };
    default:
      return state;
  }
};
