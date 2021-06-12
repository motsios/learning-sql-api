/*const Sequelize = require('sequelize')
const db = {}
const sequelize= new Sequelize('diplwmatiki','root','m19941994', {
    host :'localhost',
    dialect:'mysql',
    timezone: "+02:00",
    operatorsAliases: false,
    
    pool:{
        max:5,
        min:0,
        acquire:30000,
        idle:10000
    }
})
db.sequelize = sequelize
db.Sequelize = Sequelize

module.exports = db*/

const Sequelize = require('sequelize')
const db = {}
const sequelize= new Sequelize('heroku_f7049074a296508','ba1982a523b6c5','cf4138f6', {
    host :'db',
    port:3306,
    dialect:'mysql',
    timezone: "+02:00",

    pool:{
        max:5,
        min:0,
        acquire:30000,
        idle:10000
    }
})
db.sequelize = sequelize
db.Sequelize = Sequelize

module.exports = db