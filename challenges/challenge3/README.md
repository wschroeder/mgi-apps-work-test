# Challenge 3: Update a Tree

Use Perl or JavaScript to update a specific set of values within a tree of
objects.


## Perl

### The Problem

Given the definitions below (typeless to keep it short), write function
`update_tree()` to change all values greater than `5` to a `1`.  Note that the
`$tree` variable assignment in the example is just an example; your code
should be able to change a tree of any breadth and depth.

```perl
{
    package Node;
    use Moose;
    has 'value' => (is => 'rw');
    has 'nodes' => (is => 'ro', default => sub {[]});
}

my $tree = Node->new(value => 22,
                     nodes => [Node->new(value => 4),
                               Node->new(value => 5,
                                         nodes => [Node->new(value => 2),
                                                   Node->new(value => 7)])]);

update_tree($tree);
# $tree->nodes->[1]->nodes->[1]->value == 1
```


### Testing with Docker

Modify the `update_tree()` method in `/challenges/challenge3/perl/lib/Node.pm`
to make the `t/update_tree.t` test pass.

```bash
$ docker run --rm -it wschroeder/mgi-apps-work-test bash
root@uuid:/challenges# cd challenge3/perl

# Test failure
root@uuid:/challenges/challenge3/perl# perl t/update_tree.t
    # Subtest: example updates correctly
Implement me! at lib/Node.pm line 8.
    # Child (example updates correctly) exited without calling finalize()
not ok 1 - example updates correctly
#   Failed test 'example updates correctly'
#   at /usr/share/perl/5.22/Test/Builder.pm line 279.
# Tests were run but no plan was declared and done_testing() was not seen.
# Looks like your test exited with 29 just after 1.

# Test success
root@uuid:/challenges/challenge3/perl# perl t/update_tree.t
    # Subtest: example updates correctly
    ok 1 - 22 became 1
    ok 2 - 7 became 1
    ok 3
    ok 4
    ok 5
    1..5
ok 1 - example updates correctly
    # Subtest: another tree arrangement updates correctly
    ok 1 - 9 became 1
    ok 2 - 18 became 1
    ok 3
    ok 4
    ok 5
    ok 6
    ok 7
    1..7
ok 2 - another tree arrangement updates correctly
1..2
```


## JavaScript

### The Problem

Given the definitions below, write function `updateTree()` to change all
values greater than `5` to a `1`.  Note that the `tree` variable assignment in
the example is just an example; your code should be able to change a tree of
any breadth and depth.

function Node(value, nodes) {
    this.value = value;
    this.nodes = nodes || [];
}

var tree = new Node(22, [new Node(4),
                         new Node(5, [new Node(2),
                                      new Node(7)])]);

updateTree(tree);
// tree.nodes[1].nodes[1].value is 1


### Testing with Docker

Modify the `updateTree()` function in `/challenges/challenge3/javascript/answer.js`
to make the `test.js` test pass.

```bash
$ docker run --rm -it wschroeder/mgi-apps-work-test bash
root@uuid:/challenges# cd challenge3/javascript

# Test failure
root@uuid:/challenges/challenge3/javascript# mocha test.js
# ...
  8 passing (some time)
  4 failed
# ...

# Test success
root@uuid:/challenges/challenge3/javascript# mocha test.js
# ...
  12 passing (some time)
# ...

```

## Submission

Send me a revised `Node.lib` or `answer.js`, or send me the code that solves
this challenge.


## Notes

You may solve this challenge in whatever programming language you choose; we
highly appreciate diverse backgrounds and will need that kind of experience
for our new projects.  However, keep in mind that we use Perl and JavaScript
in the majority of our legacy codebase.  I usually ease new people in with a
few bugfixes and feature additions with these languages so that they may be
brought up to speed quickly on our workflow, designs, and cruft.

If you are not familiar with Moose, [this
presentation](https://rjbs.manxome.org/talks/moose/Moose.pdf) is an amazing
resource.

[mocha](http://mochajs.org/) is a test framework that runs on
[Node.js](https://nodejs.org).  [chai](http://chaijs.com/) is a TDD/BDD
assertion library.

The Docker image is stocked with the vim, emacs, and nano editors.

