use strict;
use warnings;

use Data::HTML::Element::Textarea;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::HTML::Element::Textarea::VERSION, 0.18, 'Version.');
