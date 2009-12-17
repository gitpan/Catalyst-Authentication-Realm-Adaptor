use Data::Dumper;
use lib 'lib';
use Catalyst::Authentication::Realm::Adaptor qw/ _munge_hash _munge_value/;

my $sourcehash = {
			'words' => [qw/the thing is good/],
			'subhash' => { 'do' => 1, 'dont' => 2, maybe => { things=> 2 }},
			'value' => 'one',
			'othervalue' => 'two'
		 };

my $modhash = {
		 'wordy' => [qw/things I need/, '+(subhash.do)'],
		 'other' => '+(words.2)',
		 'value' => '-()',
		 'newvalue' => '+(subhash.maybe.things)',
		 'othernew' => '+(subhash.maybe)'
	      };

print "Source: " . Dumper($sourcehash) . "\n======\n";
print "mod: " . Dumper($modhash) . "\n======\n";
my $newhash = Catalyst::Authentication::Realm::Adaptor::_munge_hash({}, $modhash, $sourcehash);
print Dumper($newhash);

