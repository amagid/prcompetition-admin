module.exports = {
    validateGetOne
};

function validateGetOne(input) {
    input.check('id').notEmpty().isInt();

    input.sanitize('id').toInt();
}