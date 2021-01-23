const Sequelize = require('sequelize')
const db = require('../database/db.js')
const sql_random_queries=require('./RandomQueries')
const Tables= db.sequelize.define('excersice_tables',
    {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            allowNull: false,
            autoIncrement: true
        },
        table_name: {
            type: Sequelize.STRING,
            allowNull: false,
        },
    },
    {
        tableName: 'excersice_tables',
        timestamps: false
    },
)
Tables.hasMany(sql_random_queries, {
    foreignKey: "table_id",
});
module.exports = Tables