exports.Foo = function(x, y) {
    this.x = x;
    this.y = y;
};
exports.Foo.prototype.getX = function () { return this.x; };
exports.Foo.prototype.getY = function () { return this.y; };

