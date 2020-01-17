package controllers

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"strconv"
	"strings"

	"github.com/dgrijalva/jwt-go"

	"github.com/gorilla/mux"

	"github.com/valentergs/CRMplus/models"
	"github.com/valentergs/CRMplus/utils"
	"golang.org/x/crypto/bcrypt"
)

//Controller will be exported
type Controller struct{}

//Claims will be exported
type Claims struct {
	Email string `json:"email"`
	jwt.StandardClaims
}

// Login will be exported
func (c Controller) Login(db *sql.DB) http.HandlerFunc {

	return func(w http.ResponseWriter, r *http.Request) {

		var usuario models.Usuario
		var jwt models.JWT
		var error models.Error

		json.NewDecoder(r.Body).Decode(&usuario)
		fmt.Println(usuario)

		// Essa é a senha passada pelo usuário quando enviar o request
		password := usuario.Senha

		// Verificar se usuário existe no DB
		row := db.QueryRow("select * from usuario where email=$1;", usuario.Email)

		err := row.Scan(&usuario.ID, &usuario.Nome, &usuario.Sobrenome, &usuario.Senha, &usuario.Email, &usuario.Celular, &usuario.Superuser, &usuario.Ativo, &usuario.Departamento)
		if err != nil {
			if err == sql.ErrNoRows {
				error.Message = "Usuário inexistente"
				utils.RespondWithError(w, http.StatusBadRequest, error)
				return
			} else {
				log.Fatal(err)
			}
		}

		token, err := utils.GenerateToken(usuario)
		if err != nil {
			log.Fatal(err)
		}

		// usuario.Senha é o resultado do DB query
		hashedPassword := usuario.Senha

		err = bcrypt.CompareHashAndPassword([]byte(hashedPassword), []byte(password))

		if err != nil {
			error.Message = "Senha inválida"
			utils.RespondWithError(w, http.StatusUnauthorized, error)
			return
		}

		jwt.Token = token
		utils.ResponseJSON(w, jwt)

	}
}

//Logged will be exported
func (c Controller) Logged(db *sql.DB) http.HandlerFunc {

	return func(w http.ResponseWriter, r *http.Request) {

		var erro models.Error
		var usuario models.Usuario
		var jwtKey = []byte("secret")

		if r.Method != "GET" {
			http.Error(w, http.StatusText(405), http.StatusMethodNotAllowed)
			return
		}

		// this header should have a key/value pair called "Authorization". "authHeader" will grab the key
		authHeader := r.Header.Get("Authorization")
		// bearerToken will remove the empty space found on the value
		bearerToken := strings.Split(authHeader, " ")
		// here we catch the value of bearerToken[1] leaving the word "bearer" out.
		authToken := bearerToken[1]

		// Initialize a new instance of `Claims`
		claims := &Claims{}

		tkn, err := jwt.ParseWithClaims(authToken, claims, func(token *jwt.Token) (interface{}, error) {
			return jwtKey, nil
		})

		if !tkn.Valid {
			w.WriteHeader(http.StatusUnauthorized)
			return
		}

		if err != nil {
			if err == jwt.ErrSignatureInvalid {
				w.WriteHeader(http.StatusUnauthorized)
				return
			}
			w.WriteHeader(http.StatusBadRequest)
			return
		}

		row := db.QueryRow("select * from usuario where email=$1;", claims.Email)
		err = row.Scan(&usuario.ID, &usuario.Nome, &usuario.Sobrenome, &usuario.Senha, &usuario.Email, &usuario.Celular, &usuario.Superuser, &usuario.Ativo, &usuario.Departamento)
		if err != nil {
			fmt.Println(err)
			if err == sql.ErrNoRows {
				erro.Message = "Usuário inexistente"
				utils.RespondWithError(w, http.StatusBadRequest, erro)
				return
			} else {
				log.Fatal(err)
			}
		}

		w.Header().Set("Content-Type", "application/json")

		utils.ResponseJSON(w, usuario)

	}
}

//UsuarioAdd will be exported
func (c Controller) UsuarioAdd(db *sql.DB) http.HandlerFunc {

	return func(w http.ResponseWriter, r *http.Request) {

		var usuario models.Usuario

		json.NewDecoder(r.Body).Decode(&usuario)

		// Hash usuario.Senha
		hash, err := bcrypt.GenerateFromPassword([]byte(usuario.Senha), 10)
		if err != nil {
			log.Fatal(err)
		}

		// Assign hash to usuario.Senha
		usuario.Senha = string(hash)

		sqlstmt := `insert into usuario (nome, sobrenome, senha, email, celular, superuser, ativo, departamento) values ($1,$2,$3,$4,$5,$6,$7,$8);`
		_, err = db.Exec(sqlstmt, usuario.Nome, usuario.Sobrenome, usuario.Senha, usuario.Email, usuario.Celular, usuario.Superuser, usuario.Ativo, usuario.Departamento)
		if err != nil {
			panic(err)
		}

		row := db.QueryRow("select * from usuario where email=$1;", usuario.Email)
		err = row.Scan(&usuario.ID, &usuario.Nome, &usuario.Sobrenome, &usuario.Senha, &usuario.Email, &usuario.Celular, &usuario.Superuser, &usuario.Ativo, &usuario.Departamento)

		// Hide output of usuario.Senha
		usuario.Senha = "********"

		w.Header().Set("Content-Type", "application/json")

		utils.ResponseJSON(w, usuario)

	}
}

//UsuarioGetAll will be exported
func (c Controller) UsuarioGetAll(db *sql.DB) http.HandlerFunc {

	return func(w http.ResponseWriter, r *http.Request) {

		var error models.Error

		if r.Method != "GET" {
			http.Error(w, http.StatusText(405), http.StatusMethodNotAllowed)
			return
		}

		rows, err := db.Query("select * from usuario")
		if err != nil {
			http.Error(w, http.StatusText(500), 500)
			return
		}

		defer rows.Close()

		clts := make([]models.Usuario, 0)
		for rows.Next() {
			clt := models.Usuario{}
			err := rows.Scan(&clt.ID, &clt.Nome, &clt.Sobrenome, &clt.Senha, &clt.Email, &clt.Celular, &clt.Superuser, &clt.Ativo, &clt.Departamento)
			if err != nil {
				http.Error(w, http.StatusText(500), 500)
				return
			}
			clts = append(clts, clt)
		}
		if err != nil {
			if err == sql.ErrNoRows {
				error.Message = "Usuário inexistente"
				utils.RespondWithError(w, http.StatusBadRequest, error)
				return
			} else {
				log.Fatal(err)
			}
		}

		w.Header().Set("Content-Type", "application/json")
		w.Header().Set("Access-Control-Allow-Origin", "*")

		utils.ResponseJSON(w, clts)
	}
}

//UsuarioGetOne will be exported
func (c Controller) UsuarioGetOne(db *sql.DB) http.HandlerFunc {

	return func(w http.ResponseWriter, r *http.Request) {

		var error models.Error
		var usuario models.Usuario

		if r.Method != "GET" {
			http.Error(w, http.StatusText(405), http.StatusMethodNotAllowed)
			return
		}

		// Params are the values informed by the user at the URL.
		params := mux.Vars(r)
		id, err := strconv.Atoi(params["id"])
		if err != nil {
			error.Message = "Numero ID inválido"
		}

		//The "id" used in this argument brings the value assigned at the "params"
		row := db.QueryRow("select * from usuario where usuario_id=$1;", id)

		err = row.Scan(&usuario.ID, &usuario.Nome, &usuario.Sobrenome, &usuario.Senha, &usuario.Email, &usuario.Celular, &usuario.Superuser, &usuario.Ativo, &usuario.Departamento)
		if err != nil {
			if err == sql.ErrNoRows {
				error.Message = "Usuário inexistente"
				utils.RespondWithError(w, http.StatusBadRequest, error)
				return
			} else {
				log.Fatal(err)
			}
		}

		w.Header().Set("Content-Type", "application/json")
		utils.ResponseJSON(w, usuario)

	}
}

//Search will be exported
func (c Controller) Search(db *sql.DB) http.HandlerFunc {

	return func(w http.ResponseWriter, r *http.Request) {

		var error models.Error
		// var usuario models.Usuario

		if r.Method != "GET" {
			http.Error(w, http.StatusText(405), http.StatusMethodNotAllowed)
			return
		}

		query := r.URL.Query().Get("q")

		rows, err := db.Query("select * from usuario where nome ilike '%' || $1 || '%' or sobrenome ilike '%' || $2 || '%';", query, query)
		if err != nil {
			http.Error(w, http.StatusText(500), 500)
			return
		}

		defer rows.Close()

		clts := make([]models.Usuario, 0)
		for rows.Next() {
			clt := models.Usuario{}
			err := rows.Scan(&clt.ID, &clt.Nome, &clt.Sobrenome, &clt.Senha, &clt.Email, &clt.Celular, &clt.Superuser, &clt.Ativo, &clt.Departamento)
			if err != nil {
				http.Error(w, http.StatusText(500), 500)
				return
			}
			clts = append(clts, clt)
		}
		if err != nil {
			if err == sql.ErrNoRows {
				error.Message = "Usuário inexistente"
				utils.RespondWithError(w, http.StatusBadRequest, error)
				return
			} else {
				log.Fatal(err)
			}
		}

		w.Header().Set("Content-Type", "application/json")
		utils.ResponseJSON(w, clts)

	}
}

//UsuarioDeleteOne will be exported
func (c Controller) UsuarioDeleteOne(db *sql.DB) http.HandlerFunc {

	return func(w http.ResponseWriter, r *http.Request) {

		var error models.Error
		//var usuario models.Usuario

		if r.Method != "DELETE" {
			http.Error(w, http.StatusText(405), http.StatusMethodNotAllowed)
			return
		}

		// Params is the values informed at the URL.
		params := mux.Vars(r)
		id, err := strconv.Atoi(params["id"])
		if err != nil {
			error.Message = "Numero ID inválido"
		}

		//The "id" used in this argument brings the value assigned at the "params"
		db.QueryRow("DELETE FROM usuario where usuario_id=$1;", id)

		SuccessMessage := "Usuário deletado com sucesso!"

		w.Header().Set("Content-Type", "application/json")
		w.Header().Set("Access-Control-Allow-Origin", "*")
		utils.ResponseJSON(w, SuccessMessage)

	}
}

//UsuarioUpdate will be exported
func (c Controller) UsuarioUpdate(db *sql.DB) http.HandlerFunc {

	return func(w http.ResponseWriter, r *http.Request) {

		var usuario models.Usuario
		var error models.Error

		if r.Method != "PUT" {
			http.Error(w, http.StatusText(405), http.StatusMethodNotAllowed)
			return
		}

		// Params is the values informed at the URL.
		params := mux.Vars(r)
		id, err := strconv.Atoi(params["id"])
		if err != nil {
			error.Message = "Numero ID inválido"
		}

		json.NewDecoder(r.Body).Decode(&usuario)

		sqlstmt := `UPDATE usuario SET nome=$1, sobrenome=$2, email=$3, celular=$4, superuser=$5, ativo=$6, departamento=$7 WHERE usuario_id=$8;`
		_, err = db.Exec(sqlstmt, usuario.Nome, usuario.Sobrenome, usuario.Email, usuario.Celular, usuario.Superuser, usuario.Ativo, usuario.Departamento, id)
		if err != nil {
			panic(err)
		}

		row := db.QueryRow("select * from usuario where email=$1;", usuario.Email)
		err = row.Scan(&usuario.ID, &usuario.Nome, &usuario.Sobrenome, &usuario.Senha, &usuario.Email, &usuario.Celular, &usuario.Superuser, &usuario.Ativo, &usuario.Departamento)

		w.Header().Set("Content-Type", "application/json")

		// SuccessMessage := "Usuário atualizado com sucesso!"

		utils.ResponseJSON(w, usuario)

	}
}
