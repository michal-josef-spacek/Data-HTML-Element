use strict;
use warnings;

use Data::HTML::Element::Select;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 9;
use Test::NoWarnings;

# Test.
my $obj = Data::HTML::Element::Select->new;
isa_ok($obj, 'Data::HTML::Element::Select');

# Test.
$obj = Data::HTML::Element::Select->new(
	'autofocus' => 0,
	'css_class' => 'input',
	'disabled' => 1,
	'form' => 'form-id',
	'id' => 'ID',
	'label' => 'Label',
	'multimple' => 1,
	'name' => 'Select name',
	'options' => [],
	'required' => 1,
	'size' => 2,
);
isa_ok($obj, 'Data::HTML::Element::Select');

# Test.
eval {
	Data::HTML::Element::Select->new(
		'autofocus' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'autofocus' must be a bool (0/1).\n",
	"Parameter 'autofocus' must be a bool (0/1) (bad).");
clean();

# Test
eval {
	Data::HTML::Element::Select->new(
		'css_class' => '@bad',
	);
};
is($EVAL_ERROR, "Parameter 'css_class' has bad CSS class name.\n",
	"Parameter 'css_class' has bad CSS class name (\@bad).");
clean();

# Test.
eval {
	Data::HTML::Element::Select->new(
		'disabled' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'disabled' must be a bool (0/1).\n",
	"Parameter 'disabled' must be a bool (0/1) (bad).");
clean();

# Test.
eval {
	Data::HTML::Element::Select->new(
		'multiple' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'multiple' must be a bool (0/1).\n",
	"Parameter 'multiple' must be a bool (0/1) (bad).");
clean();

# Test.
eval {
	Data::HTML::Element::Select->new(
		'required' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'required' must be a bool (0/1).\n",
	"Parameter 'required' must be a bool (0/1) (bad).");
clean();

# Test.
eval {
	Data::HTML::Element::Select->new(
		'size' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'size' must be a number.\n",
	"Parameter 'size' must be a number (bad).");
clean();
