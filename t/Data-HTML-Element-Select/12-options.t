use strict;
use warnings;

use Data::HTML::Element::Select;
use Data::HTML::Element::Option;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $obj = Data::HTML::Element::Select->new;
my $ret = $obj->options;
is_deeply(
	$ret,
	[],
	'Get options ([] - default).',
);

# Test.
$obj = Data::HTML::Element::Select->new(
	'options' => [],
);
$ret = $obj->options;
is_deeply(
	$ret,
	[],
	'Get options ([]).',
);

# Test.
$obj = Data::HTML::Element::Select->new(
	'options' => [
		Data::HTML::Element::Option->new,
		Data::HTML::Element::Option->new,
	],
);
$ret = $obj->options;
is(@{$ret}, 2, 'Get options (two options).');
