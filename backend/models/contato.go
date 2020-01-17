package models

//Contato is an exportable type
type Contato struct {
	ID       int    `json:"cliente_id"`
	Cliente  int    `json:"cliente"`
	Nome     string `json:"nome"`
	Email    string `json:"email"`
	Telefone int    `json:"telefone"`
	Celular  int    `json:"celular"`
}
