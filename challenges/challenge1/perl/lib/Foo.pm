package Foo;
use Moose;

has x => (is => 'ro', required => 1);
has y => (is => 'ro', required => 1);

sub transform_data {
    die "Implement me!";
}

1;

