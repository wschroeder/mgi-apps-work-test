# Challenge 1: Transform Data

Use Perl or JavaScript to transform data from a list of objects with
attributes into a specific hashmap arrangement.


## Perl

### The Problem

Given a [Moose](https://metacpan.org/pod/Moose) class `Foo`, which has
attributes `x` and `y`, write the `transform_data()` function.

```perl
my @f = (Foo->new(x => $x1, y => $y1),
         Foo->new(x => $x2, y => $y2),
         ...);                                # Insert more instances here

# $f[1]->x returns $x2

my %transformed = Foo::transform_data(@f);

# %transformed is ($x1 => { value => $y1 },  # Result is a simple hashmap.
#                  $x2 => { value => $y2 },  # This is real code in our codebase!
#                  ...);                     # We will add more keys next to "value" later.
```


### Testing with Docker

Modify the `transform_data()` function in `/challenges/challenge1/perl/lib/Foo.pm`
to make the `t/transform_data.t` test pass.

```bash
$ docker run --rm -it wschroeder/mgi-apps-work-test bash
root@uuid:/challenges# cd challenge1/perl

# Test failure
root@uuid:/challenges/challenge1/perl# perl t/transform_data.t
Implement me! at lib/Foo.pm line 8.

# Test success
root@uuid:/challenges/challenge1/perl# perl t/transform_data.t
ok 1 - Data is correctly transformed
1..1
```


## JavaScript

### The Problem

Given a function class `Foo` with accessors `getX()` and `getY()` as defined
below, write the `transformData()` function:

```javascript
Foo = function(x, y) {
    this.x = x;
    this.y = y;
};
Foo.prototype.getX = function () { return this.x; };
Foo.prototype.getY = function () { return this.y; };

var array_of_foos = [new Foo(x1, y1), new Foo(x2, y2), ...];

// array_of_foos[1].getX() returns x2
var transformed = transformData(array_of_foos);

// transformed is [ {x1: {value: y1}},
//                  {x2: {value: y2}},
//                  ... ]
```


### Testing with Docker

Modify the `transformData()` function in `/challenges/challenge1/javascript/answer.js`
to make the `test.js` test pass.

```bash
$ docker run --rm -it wschroeder/mgi-apps-work-test bash
root@uuid:/challenges# cd challenge1/javascript

# Test failure
root@uuid:/challenges/challenge1/javascript# mocha test.js


  1) should be transformed

  0 passing (13ms)
  1 failing

  1)  should be transformed:
     AssertionError: expected undefined to deeply equal [ Array(3) ]
      at Assertion.assertEqual (node_modules/chai/lib/chai/core/assertions.js:485:19)
      at Assertion.ctx.(anonymous function) [as equal] (node_modules/chai/lib/chai/utils/addMethod.js:41:25)
      at Context.<anonymous> (test.js:24:33)

# Test success
root@uuid:/challenges/challenge1/javascript# mocha test.js


  ✓ should be transformed

  1 passing (7ms)

```


## Submission

Send me a revised `Foo.pm` or `answer.js`, or send me the code that solves
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

