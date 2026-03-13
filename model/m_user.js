const mysql     = require('mysql2')
const db        = mysql.createConnection({
    host: 'localhost',
    user: 'dosencod_deploy',
    password: 'Rahasia2026',
    database: 'dosencod_kelas_jfd'
})
db.connect()


module.exports =
{
    get_1_username: function(form_username) {
        let sql = mysql.format(
            'SELECT * FROM user WHERE username = ?', [form_username]
        )

        return new Promise( function(resolve,reject) {
            db.query(sql, function(errorSql, hasil) {
                if (errorSql) {
                    reject(errorSql)
                } else {
                    resolve(hasil)
                }
            })
        })
    }
}