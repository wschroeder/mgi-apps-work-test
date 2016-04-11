package Node;
use Moose;

has 'value' => (is => 'rw');
has 'nodes' => (is => 'ro', default => sub {[]});

sub update_tree {
    die "Implement me!";
}

1;

