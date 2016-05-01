Cookbook - test
===============

Configuration
-------------

- OS X El Capitan version 10.11.4
- Docker version 1.11.0, build 4dc5990 (Mac app 1.11.0-beta9)
- Ruby 2.3.1 (via rbenv)


Setup
-----

Install gem dependencies (first run only):

    $ gem install bundler # if not already installed
    $ bundle

Update cookbook dependencies (first run only):

    $ berks
    Resolving cookbook dependencies...
    Fetching 'test' from source at .
    Using test (0.0.1) from source at .

Ensure kitchen is able to create the container (first run only):

    $ bundle exec kitchen create
    -----> Starting Kitchen (v1.7.3)
    -----> Creating <test-centos>...
           0.0.0.0:32781
           [SSH] Established
           Finished creating <test-centos> (0m4.35s).
    -----> Kitchen is finished. (0m4.71s)

Ensure kitchen is able to converge the cookbook (first run only):

    $ bundle exec kitchen converge
    -----> Starting Kitchen (v1.7.3)
    -----> Converging <test-centos>...
    $$$$$$ Running legacy converge for 'Docker' Driver
           Preparing files for transfer
           Preparing dna.json
           Resolving cookbook dependencies with Berkshelf 4.3.2...
           Removing non-cookbook files before transfer
           Preparing solo.rb
    -----> Chef Omnibus installation detected (install only if missing)
           Transferring files to <test-centos>
           Starting Chef Client, version 12.9.38
           [2016-05-01T19:11:31+00:00] WARN: unable to detect ipaddress
           Installing Cookbook Gems:
           Compiling Cookbooks...
           Converging 1 resources
           Recipe: test::default
             * file[/tmp/quick_brown_fox.txt] action create (up to date)
       
           Running handlers:
           Running handlers complete
           Chef Client finished, 0/1 resources updated in 01 seconds
           Finished converging <test-centos> (0m2.80s).
    -----> Kitchen is finished. (0m3.14s)

Run tests:

    $ bundle exec kitchen test
