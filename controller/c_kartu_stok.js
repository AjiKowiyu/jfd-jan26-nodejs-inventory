const m_produk      = require('../model/m_produk')
const m_stok_produk = require('../model/m_stok_produk')
const moment        = require('moment')

module.exports =
{


    index: async function(req,res) {
        res.render('kartu-stok/main', {
            req: req,
            moment: moment,
            produk: await m_produk.get_semua_produk(),
            stok_barang: await m_stok_produk.get_semua_produk_by_kode(),
        })
    },


}