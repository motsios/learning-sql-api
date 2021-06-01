const Sequelize = require('sequelize')
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

module.exports = db 