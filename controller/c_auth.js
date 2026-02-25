const m_user = require('../model/m_user')

module.exports =
{

    form_login: function(req,res) {
        res.render('auth/form-login', {
            req: req,
        }) //ejs
    },



    proses_login: async function(req,res) {
        // ambil inputan username & password dari html
        let form_username = req.body.form_username
        let form_password = req.body.form_password

        // cek ke db, table user, cari username
        let username_exist = await m_user.get_1_username(form_username)
        if (username_exist.length > 0) {
            // jika dapat usernamenya, maka lakukan pengecekan password
            res.send('lanjut cek password')
        } else {
            // jika tidak ada username-nya, kita berikan info error + kembalikan ke halaman login
            res.redirect(`/login?msg=username tidak terdaftar, silakan hubungi administrator sistem.`)
        }
        // jika password cocok, maka redirect ke halaman dashboard
        // jika password salah, kita berikan info error + kembalikan ke halaman login
    }

}