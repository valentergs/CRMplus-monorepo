package driver

import "database/sql"

var db *sql.DB

//ConnectDB will be an exported func
func ConnectDB() *sql.DB {

	var err error

	db, err = sql.Open("postgres", "user=rodrigovalente password=Gustavo2012 host=postgres port=5432 dbname=CRMplus sslmode=disable")
	if err != nil {
		panic(err)
	}

	return db

}
