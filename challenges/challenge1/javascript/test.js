Foo           = require('./foo.js').Foo;
transformData = require('./answer.js').transformData;
expect        = require('chai').expect;

crypto = require('crypto');
function randomNumber() {
    return crypto.randomBytes(4).readUInt32LE(0);
}

var values = [1,2,3,4,5,6].map(randomNumber);
var array_of_foos = [
    new Foo(values[0], values[3]),
    new Foo(values[1], values[4]),
    new Foo(values[2], values[5])
];

var transformed = transformData(array_of_foos);
var expected_transform = [{}, {}, {}];
expected_transform[0][values[0]] = { value: values[3] };
expected_transform[1][values[1]] = { value: values[4] };
expected_transform[2][values[2]] = { value: values[5] };

it("should be transformed", function() {
    expect(transformed).to.deep.equal(expected_transform);
});

