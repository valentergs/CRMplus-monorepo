package models

//Cliente is an exportable type
type Cliente struct {
	ID       int    `json:"cliente_id"`
	Cliente  string `json:"cliente"`
	Unidade  string `json:"unidade"`
	Endereço string `json:"endereco"`
	Cidade   string `json:"cidade"`
	Estado   string `json:"estado"`
	Pais     string `json:"pais"`
	CEP      int    `json:"cep"`
	Contato  int    `json:"contato"`
}
