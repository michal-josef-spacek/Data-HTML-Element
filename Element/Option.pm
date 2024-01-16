package Data::HTML::Element::Option;

use strict;
use warnings;

use Error::Pure qw(err);
use List::Util 1.33 qw(none);
use Mo qw(build is);
use Mo::utils qw(check_array check_bool check_number);
use Mo::utils::CSS qw(check_css_class);
use Readonly;

Readonly::Array our @DATA_TYPES => qw(plain tags);

our $VERSION = 0.10;

has css_class => (
	is => 'ro',
);

has data => (
	default => [],
	is => 'ro',
);

has data_type => (
	is => 'ro',
);

has disabled => (
	is => 'ro',
);

has id => (
	is => 'ro',
);

has label => (
	is => 'ro',
);

has selected => (
	is => 'ro',
);

has value => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check data type.
	if (! defined $self->{'data_type'}) {
		$self->{'data_type'} = 'plain';
	}
	if (none { $self->{'data_type'} eq $_ } @DATA_TYPES) {
		err "Parameter 'data_type' has bad value.";
	}

	# Check data based on type.
	check_array($self, 'data');
	foreach my $data_item (@{$self->{'data'}}) {
		# Plain mode
		if ($self->{'data_type'} eq 'plain') {
			if (ref $data_item ne '') {
				err "Parameter 'data' in 'plain' mode must contain ".
					'reference to array with scalars.';
			}
		# Tags mode.
		} else {
			if (ref $data_item ne 'ARRAY') {
				err "Parameter 'data' in 'tags' mode must contain ".
					"reference to array with references ".
					'to array with Tags structure.';
			}
		}
	}

	# Check CSS class.
	check_css_class($self, 'css_class');

	# Check disabled.
	if (! defined $self->{'disabled'}) {
		$self->{'disabled'} = 0;
	}
	check_bool($self, 'disabled');

	# Check selected.
	if (! defined $self->{'selected'}) {
		$self->{'selected'} = 0;
	}
	check_bool($self, 'selected');

	return;
}

1;

__END__
