Node       = require('./node.js').Node;
updateTree = require('./answer.js').updateTree;
expect     = require('chai').expect;

(function(){
    var tree = new Node(22, [new Node(4),
                             new Node(5, [new Node(2),
                                          new Node(7)])]);

    updateTree(tree);

    it("22 became 1", function() {
        expect(tree.value).to.equal(1);
    });
    it("7 became 1", function() {
        expect(tree.nodes[1].nodes[1].value).to.equal(1);
    });

    it("4 remained", function() {
        expect(tree.nodes[0].value).to.equal(4);
    });
    it("5 remained", function() {
        expect(tree.nodes[1].value).to.equal(5);
    });
    it("2 remained", function() {
        expect(tree.nodes[1].nodes[0].value).to.equal(2);
    });
})();

(function(){
    var tree = new Node(3, [new Node(9),
                            new Node(3, [new Node(5),
                                         new Node(5),
                                         new Node(5, [new Node(18)])])]);

    updateTree(tree);

    it("9 became 1", function() {
        expect(tree.nodes[0].value).to.equal(1);
    });
    it("18 became 1", function() {
        expect(tree.nodes[1].nodes[2].nodes[0].value).to.equal(1);
    });

    it("first 3 remained", function() {
        expect(tree.value).to.equal(3);
    });
    it("second 3 remained", function() {
        expect(tree.nodes[1].value).to.equal(3);
    });
    it("first 5 remained", function() {
        expect(tree.nodes[1].nodes[0].value).to.equal(5);
    });
    it("second 5 remained", function() {
        expect(tree.nodes[1].nodes[1].value).to.equal(5);
    });
    it("third 5 remained", function() {
        expect(tree.nodes[1].nodes[2].value).to.equal(5);
    });
})();


