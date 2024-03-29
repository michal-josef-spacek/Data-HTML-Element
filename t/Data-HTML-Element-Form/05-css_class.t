use strict;
use warnings;

use Data::HTML::Element::Form;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Data::HTML::Element::Form->new;
is($obj->css_class, undef, 'Get CSS class (undef - default).');

# Test.
$obj = Data::HTML::Element::Form->new(
	'css_class' => 'css-class',
);
is($obj->css_class, 'css-class', 'Get CSS class (css-class).');
