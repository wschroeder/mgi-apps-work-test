use strict;
use warnings;
use Test::More;
use lib 'lib';
use Foo;

my ($x1, $x2, $x3, $y1, $y2, $y3) = map { int(rand() * 100000) } (1..6);

my @f = (Foo->new(x => $x1, y => $y1),
         Foo->new(x => $x2, y => $y2),
         Foo->new(x => $x3, y => $y3));

my %transformed = Foo::transform_data(@f);
is_deeply(
    \%transformed,
    {
        $x1 => { value => $y1 },
        $x2 => { value => $y2 },
        $x3 => { value => $y3 },
    },
    'Data is correctly transformed',
);

done_testing;

