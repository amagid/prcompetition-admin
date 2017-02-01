const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();

const Attendance = module.exports = db.define('attendance', {
    date: {
        field: 'date',
        type: Sequelize.DataTypes.DATE,
        allowNull: false
    },
    comment: {
        field: 'comment',
        type: Sequelize.DataTypes.STRING
    }
}, {
    classMethods: {
        findByIds
    }
});

function findByIds(p_id, o_id) {
    const options = {};

    options.where = {
        p_id,
        o_id
    };

    return this.constructor.prototype.findOne.call(this, options)
        .then(result => {
            if (result) {
                return result;
            } else {
                throw APIError(404, 'Attendance Record not found.');
            }
        });
}