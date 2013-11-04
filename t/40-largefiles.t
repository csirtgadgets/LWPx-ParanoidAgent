BEGIN {
    unless ($ENV{RELEASE_TESTING} || $ENV{ONLINE_TESTS}) {
        require Test::More;
        Test::More::plan(skip_all=>'these online tests require env variable ONLINE_TESTS be set to run');
    }
}

use Test::More;
BEGIN { use_ok('LWPx::ParanoidAgent') };

use LWPx::ParanoidAgent;
 
my @urls = qw(
    https://freedom-to-tinker.com/feed/
    https://archiveofourown.org/tags/301813/feed.atom/
    http://archiveofourown.org/tags/301813/feed.atom/
    https://gist.github.com/anall/a17825ceeaf7265db89c/raw/eb88384b4e8c8a53bb7662d00dec6ca6c2597500/small
    https://gist.github.com/anall/a17825ceeaf7265db89c/raw/95ea189f5a587b72a29aae08418b93af19c223a7/512
    https://gist.github.com/anall/a17825ceeaf7265db89c/raw/bcb8ab88224290e1e4a3d8c1fe89106344b0c5b0/1024
    https://gist.github.com/anall/a17825ceeaf7265db89c/raw/08bded8e2a59690f3bad6157f9a0568c18291587/4096
    https://gist.github.com/anall/a17825ceeaf7265db89c/raw/dc5783e94620b27095996adfe0e2517f03feec72/10240
    https://gist.github.com/anall/a17825ceeaf7265db89c/raw/781c8f4364d61eef01d4a1bb51b48a74727af4ff/15360
    https://gist.github.com/anall/a17825ceeaf7265db89c/raw/93e572d54a0915342f0c1ad23e16b284c244303e/17920
    https://gist.github.com/anall/a17825ceeaf7265db89c/raw/f372579ea6fe2d8e732c1e62da927864bf67e22d/19200
    https://gist.github.com/anall/a17825ceeaf7265db89c/raw/017a2cbb06b224bd4459aacff5cc08c0ff8fc317/20480
    https://gist.github.com/anall/a17825ceeaf7265db89c/raw/88af83af904efe675e23b19a4e0367647b4cbea5/40960
    http://s.andreanall.com/tmp/lwpx/19200.txt
    http://s.andreanall.com/tmp/lwpx/20480.txt
    http://s.andreanall.com/tmp/lwpx/40960.txt
);
 
my $ua = LWPx::ParanoidAgent->new(
    ssl_opts => {
        verify_hostname => 0,
        SSL_verify_mode => 'SSL_VERIFY_NONE',
    }
);

foreach my $url (@urls) {
    my $res=$ua->get($url);
    ok($res->status_line !~ m/Can't read entity body/);
    ok($res->is_success());
}

done_testing();