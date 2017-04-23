module.exports = {
    validateGetOne,
    validatePost,
    validateDelete,
    validatePatch
};

const caseIDPattern = /[a-z]{1,3}[0-9]*/;

function validateGetOne(input) {
    input.check('caseid').notEmpty().matches(caseIDPattern);
}

function validatePost(input) {
    input.check('name').notEmpty();
    input.check('caseid').notEmpty().matches(caseIDPattern);
}

function validateDelete(input) {
    input.check('caseid').notEmpty().matches(caseIDPattern);
}

function validatePatch(input) {
    input.check('caseid').notEmpty().matches(caseIDPattern);
    input.check('updates.name').optional();
    input.check('updates.points').optional().isInt();
    input.check('updates.caseid').optional().matches(caseIDPattern);
}