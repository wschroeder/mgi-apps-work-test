use strict;
use warnings;
use Test::More;
use lib 'lib';
use Node;

subtest "example updates correctly" => sub {
    my $tree = Node->new(value => 22,
                         nodes => [Node->new(value => 4),
                                   Node->new(value => 5,
                                             nodes => [Node->new(value => 2),
                                                       Node->new(value => 7)])]);

    $tree->update_tree();

    is($tree->value, 1, '22 became 1');
    is($tree->nodes->[1]->nodes->[1]->value, 1, '7 became 1');

    is($tree->nodes->[0]->value, 4);
    is($tree->nodes->[1]->value, 5);
    is($tree->nodes->[1]->nodes->[0]->value, 2);
};

subtest "another tree arrangement updates correctly" => sub {
    my $tree = Node->new(value => 3,
                         nodes => [Node->new(value => 9),
                                   Node->new(value => 3,
                                             nodes => [Node->new(value => 5),
                                                       Node->new(value => 5),
                                                       Node->new(value => 5,
                                                                 nodes => [Node->new(value => 18)])])]);

    $tree->update_tree();

    is($tree->nodes->[0]->value, 1, '9 became 1');
    is($tree->nodes->[1]->nodes->[2]->nodes->[0]->value, 1, '18 became 1');

    is($tree->value, 3);
    is($tree->nodes->[1]->value, 3);
    is($tree->nodes->[1]->nodes->[0]->value, 5);
    is($tree->nodes->[1]->nodes->[1]->value, 5);
    is($tree->nodes->[1]->nodes->[2]->value, 5);
};

done_testing;

