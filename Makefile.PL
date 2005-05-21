use ExtUtils::MakeMaker;
WriteMakefile( 'NAME' => 'LWPx::ParanoidAgent',
               'VERSION_FROM' => 'lib/LWPx/ParanoidAgent.pm',
               'PREREQ_PM'		=> {
                   'LWP::UserAgent' => 0,
                   'Net::DNS'       => 0,
                   'Time::HiRes'    => 0,
               },
               ($] >= 5.005 ?
                (ABSTRACT_FROM => 'lib/LWPx/ParanoidAgent.pm',
                 AUTHOR     => 'Brad Fitzpatrick <brad@danga.com>') : ()),
               );

