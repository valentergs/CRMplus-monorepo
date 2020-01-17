package models

//Usuario is an exportable type
type Usuario struct {
	ID           int    `json:"usuario_id"`
	Nome         string `json:"nome"`
	Sobrenome    string `json:"sobrenome"`
	Senha        string `json:"senha"`
	Email        string `json:"email"`
	Celular      string `json:"celular"`
	Superuser    bool   `json:"superuser"`
	Ativo        bool   `json:"ativo"`
	Departamento string `json:"departamento"`
}
