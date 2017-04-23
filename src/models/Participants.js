const Sequelize = require('sequelize');
const db = require('../services/mysql').connection();
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
    }
}, {
    classMethods: {
        getSummary,
        recalculateOne,
        recalculateAll
    }
});

function getSummary() {
    const queryString = "SELECT caseid, name, points FROM participants";
    return _executeQuery(queryString);
}

function recalculateOne(caseid) {
    const queryString = `UPDATE participants oldpoints INNER JOIN (SELECT caseid, SUM(points) AS "points" FROM ((SELECT p.caseid, (ap.value * e.multiplier) AS "points" FROM participants p INNER JOIN additional_points ap ON p.caseid=ap.recipient AND p.caseid="${caseid}" INNER JOIN events e ON ap.event = e.event AND ap.semester=e.semester AND ap.year = e.year)

    UNION ALL

    (SELECT p.caseid, (ft.value * c.multiplier * (1 + 2 * u.used) * (CASE WHEN u.event IS NULL THEN 1 ELSE e.multiplier END)) AS "points" FROM participants p INNER JOIN uploads u ON u.submitter = p.caseid AND p.caseid="${caseid}" INNER JOIN file_types ft ON u.file_type = ft.file_type INNER JOIN content c ON u.content = c.content LEFT OUTER JOIN events e ON u.event = e.event AND u.semester = e.semester AND u.year = e.year)

    UNION ALL

    (SELECT p.caseid, (30 * adt.multiplier * e.multiplier) AS "points" FROM participants p INNER JOIN advertisements a ON p.caseid=a.seller AND p.caseid="${caseid}" INNER JOIN ad_types adt ON a.ad_type = adt.ad_type INNER JOIN events e ON a.event=e.event AND a.semester=e.semester AND a.year=e.year)

    UNION ALL

    (SELECT p.caseid, (20 * adt.multiplier * e.multiplier) AS "points" FROM participants p INNER JOIN advertisements a ON p.caseid=a.creator AND p.caseid="${caseid}" INNER JOIN ad_types adt ON a.ad_type = adt.ad_type INNER JOIN events e ON a.event=e.event AND a.semester=e.semester AND a.year=e.year)

    UNION ALL

    (SELECT p.caseid, (o.value * e.multiplier) AS "points" FROM participants p INNER JOIN attendance a ON p.caseid=a.participant AND p.caseid="${caseid}" INNER JOIN opportunities o ON o.opportunity=a.opportunity INNER JOIN events e ON o.event=e.event AND o.semester=e.semester AND o.year=e.year)) AS allpoints GROUP BY caseid) AS newpoints ON oldpoints.caseid=newpoints.caseid SET oldpoints.points=newpoints.points WHERE oldpoints.caseid="${caseid}";`;

    return _executeQuery(queryString);
}

function recalculateAll() {
    const queryString = `UPDATE participants oldpoints INNER JOIN (SELECT caseid, SUM(points) AS "points" FROM ((SELECT p.caseid, (ap.value * e.multiplier) AS "points" FROM participants p INNER JOIN additional_points ap ON p.caseid=ap.recipient INNER JOIN events e ON ap.event = e.event AND ap.semester=e.semester AND ap.year = e.year)

    UNION ALL

    (SELECT p.caseid, (ft.value * c.multiplier * (1 + 2 * u.used) * (CASE WHEN u.event IS NULL THEN 1 ELSE e.multiplier END)) AS "points" FROM participants p INNER JOIN uploads u ON u.submitter = p.caseid INNER JOIN file_types ft ON u.file_type = ft.file_type INNER JOIN content c ON u.content = c.content LEFT OUTER JOIN events e ON u.event = e.event AND u.semester = e.semester AND u.year = e.year)

    UNION ALL

    (SELECT p.caseid, (30 * adt.multiplier * e.multiplier) AS "points" FROM participants p INNER JOIN advertisements a ON p.caseid=a.seller INNER JOIN ad_types adt ON a.ad_type = adt.ad_type INNER JOIN events e ON a.event=e.event AND a.semester=e.semester AND a.year=e.year)

    UNION ALL

    (SELECT p.caseid, (20 * adt.multiplier * e.multiplier) AS "points" FROM participants p INNER JOIN advertisements a ON p.caseid=a.creator INNER JOIN ad_types adt ON a.ad_type = adt.ad_type INNER JOIN events e ON a.event=e.event AND a.semester=e.semester AND a.year=e.year)

    UNION ALL

    (SELECT p.caseid, (o.value * e.multiplier) AS "points" FROM participants p INNER JOIN attendance a ON p.caseid=a.participant INNER JOIN opportunities o ON o.opportunity=a.opportunity INNER JOIN events e ON o.event=e.event AND o.semester=e.semester AND o.year=e.year)) AS allpoints GROUP BY caseid) AS newpoints ON oldpoints.caseid=newpoints.caseid SET oldpoints.points=newpoints.points;`;
    
    return _executeQuery(queryString);
}

//Not sure if this process is accurate for all requests.
function _executeQuery(queryString) {
    return db.query(queryString).then(result => {
        return result[0];
    });
}