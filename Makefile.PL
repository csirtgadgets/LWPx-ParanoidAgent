use ExtUtils::MakeMaker;
WriteMakefile( 
    'NAME'          => 'LWPx::ParanoidAgent',
    'VERSION_FROM'  => 'lib/LWPx/ParanoidAgent.pm',
    'PREREQ_PM'		=> {
        'LWP::UserAgent'    => 0,
        'Net::DNS'          => 0,
        'Time::HiRes'       => 0,
        'Net::SSL'          => '2.85'
    },
    'META_MERGE'  => {
        "resources"   => {
            "repository"    => 'https://github.com/collectiveintel/LWPx-ParanoidAgent.git',
            "bugtracker"    => 'https://github.com/collectiveintel/lwpx-paranoidagent/issues',
            "homepage"      => 'https://github.com/collectiveintel/LWPx-ParanoidAgent',
        },
    },
    (
        $] >= 5.005 ?
        (
            ABSTRACT_FROM => 'lib/LWPx/ParanoidAgent.pm',
            AUTHOR     => 'Wes Young <wes@barely3am.com>'
        ) : ()
    ),
);

