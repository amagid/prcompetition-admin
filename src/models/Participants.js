const Sequelize = require('sequelize');
const mysql = require('../services/mysql');
const db = mysql.connection();
const APIError = require('../APIError');

const Participants = module.exports = db.define('participants', {
    caseid: {
        field: 'caseid',
        type: Sequelize.DataTypes.STRING,
        allowNull: false,
        primaryKey: true
    },
    name: {
        field: 'name',
        type: Sequelize.DataTypes.STRING,
        allowNull: false
    },
    points: {
        field: 'points',
        type: Sequelize.DataTypes.INTEGER,
        allowNull: false,
        defaultValue: 0
    },
    active: {
        field: 'active',
        type: Sequelize.DataTypes.BOOLEAN,
        allowNull: false,
        defaultValue: 0
    }
}, {
    classMethods: {
        getSummary,
        recalculateOne,
        recalculateAll,
        findAll,
        create,
        deleteOne,
        updateByCaseID
    }
});

function getSummary() {
    let queryString = "SELECT caseid, name, points FROM participants WHERE active=1 ORDER BY points DESC";
    return mysql.executeQuery(queryString);
}

function recalculateOne(caseid) {
    const queryString = `UPDATE participants oldpoints INNER JOIN (SELECT caseid, SUM(points) AS "points" FROM ((SELECT p.caseid, (ap.value * e.multiplier) AS "points" FROM participants p INNER JOIN additional_points ap ON p.caseid=ap.recipient AND p.caseid="${caseid}" INNER JOIN events e ON ap.event = e.event AND ap.semester=e.semester AND ap.year = e.year)

    UNION ALL

    (SELECT p.caseid, (ft.value * c.multiplier * (1 + 2 * u.used) * (CASE WHEN u.event IS NULL THEN 1 ELSE e.multiplier END)) AS "points" FROM participants p INNER JOIN uploads u ON u.submitter = p.caseid AND p.caseid="${caseid}" INNER JOIN file_types ft ON u.file_type = ft.file_type INNER JOIN content c ON u.content = c.content LEFT OUTER JOIN events e ON u.event = e.event AND u.semester = e.semester AND u.year = e.year)

    UNION ALL

    (SELECT p.caseid, (30 * (CASE WHEN adt.multiplier IS NULL THEN 1 ELSE adt.multiplier END) * e.multiplier) AS "points" FROM participants p INNER JOIN advertisements a ON p.caseid=a.seller AND p.caseid="${caseid}" LEFT OUTER JOIN ad_types adt ON a.ad_type = adt.ad_type INNER JOIN events e ON a.event=e.event AND a.semester=e.semester AND a.year=e.year)

    UNION ALL

    (SELECT p.caseid, (20 * (CASE WHEN adt.multiplier IS NULL THEN 1 ELSE adt.multiplier END) * e.multiplier) AS "points" FROM participants p INNER JOIN advertisements a ON p.caseid=a.creator AND p.caseid="${caseid}" LEFT OUTER JOIN ad_types adt ON a.ad_type = adt.ad_type INNER JOIN events e ON a.event=e.event AND a.semester=e.semester AND a.year=e.year)

    UNION ALL

    (SELECT p.caseid, (o.value * e.multiplier) AS "points" FROM participants p INNER JOIN attendance a ON p.caseid=a.participant AND p.caseid="${caseid}" INNER JOIN opportunities o ON o.opportunity=a.opportunity INNER JOIN events e ON o.event=e.event AND o.semester=e.semester AND o.year=e.year)) AS allpoints GROUP BY caseid) AS newpoints ON oldpoints.caseid=newpoints.caseid SET oldpoints.points=newpoints.points WHERE oldpoints.caseid="${caseid}";`;

    return mysql.executeQuery(queryString);
}

function recalculateAll() {
    const queryString = `UPDATE participants oldpoints INNER JOIN (SELECT caseid, SUM(points) AS "points" FROM ((SELECT p.caseid, (ap.value * e.multiplier) AS "points" FROM participants p INNER JOIN additional_points ap ON p.caseid=ap.recipient INNER JOIN events e ON ap.event = e.event AND ap.semester=e.semester AND ap.year = e.year)

    UNION ALL

    (SELECT p.caseid, (ft.value * c.multiplier * (1 + 2 * u.used) * (CASE WHEN u.event IS NULL THEN 1 ELSE e.multiplier END)) AS "points" FROM participants p INNER JOIN uploads u ON u.submitter = p.caseid INNER JOIN file_types ft ON u.file_type = ft.file_type INNER JOIN content c ON u.content = c.content LEFT OUTER JOIN events e ON u.event = e.event AND u.semester = e.semester AND u.year = e.year)

    UNION ALL

    (SELECT p.caseid, (30 * (CASE WHEN adt.multiplier IS NULL THEN 1 ELSE adt.multiplier END) * e.multiplier) AS "points" FROM participants p INNER JOIN advertisements a ON p.caseid=a.seller LEFT OUTER JOIN ad_types adt ON a.ad_type = adt.ad_type INNER JOIN events e ON a.event=e.event AND a.semester=e.semester AND a.year=e.year)

    UNION ALL

    (SELECT p.caseid, (20 * (CASE WHEN adt.multiplier IS NULL THEN 1 ELSE adt.multiplier END) * e.multiplier) AS "points" FROM participants p INNER JOIN advertisements a ON p.caseid=a.creator LEFT OUTER JOIN ad_types adt ON a.ad_type = adt.ad_type INNER JOIN events e ON a.event=e.event AND a.semester=e.semester AND a.year=e.year)

    UNION ALL

    (SELECT p.caseid, (o.value * e.multiplier) AS "points" FROM participants p INNER JOIN attendance a ON p.caseid=a.participant INNER JOIN opportunities o ON o.opportunity=a.opportunity INNER JOIN events e ON o.event=e.event AND o.semester=e.semester AND o.year=e.year)) AS allpoints GROUP BY caseid) AS newpoints ON oldpoints.caseid=newpoints.caseid SET oldpoints.points=newpoints.points;`;
    
    return mysql.executeQuery(queryString);
}

function findAll() {
    const queryString = "SELECT * FROM participants;";

    return mysql.executeQuery(queryString);
}

function create(data) {
    const {name, caseid, points, active} = data;
    const queryString = `INSERT INTO participants (caseid, name, points, active, created_at, updated_at, deleted_at)
                        VALUES ("${caseid}", "${name}", ${points}, ${active || false}, NOW(), NOW(), NULL);`;

    return mysql.executeQuery(queryString);
}

function deleteOne(caseid) {
    const queryString = `DELETE FROM participants WHERE caseid="${caseid}";`;

    return mysql.executeQuery(queryString);
}

function updateByCaseID(caseid, newData) {
    const {newCaseID, newName, newPoints, newActive} = newData;
    const queryString = `UPDATE participants SET caseid="${newCaseID}", name="${newName}", points="${newPoints}", active="${newActive}" WHERE caseid="${caseid}";`;

    return mysql.executeQuery(queryString);
}