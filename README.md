Fork
===

I've made some mods to the origina cron repository. Most notably, i've added "seconds" resolution. Would it be nice to add micros? Probably yes.

Install
---

make

Example
---

This simple example takes a "microsecond delay" and a "cron string" as arguments. It then sleeps for the microsecond delay and prints "ping" if the current time matches the schedule represented by the cron string.

```
./.cabal-sandbox/bin/ping 1000000 "*/2 * * * * *"
```

Parsing cron strings
---

```
 parseOnly cronSchedule "*/2 * 3 * 4,5,6"
 parseOnly cronScheduleLoose "*/2 * 3 * 4,5,6"
 parseOnly cronScheduleLooseGranular "* */2 * 3 * 4,5,6"
```

TODO
---

Cover my modifications via the already-existing test suite/hspec.


cron
====
[![Build Status](https://secure.travis-ci.org/MichaelXavier/cron.png)](http://travis-ci.org/MichaelXavier/cron)

Cron data structure and Attoparsec parser for Haskell. The idea is to embed it
in larger systems which want to roll their own scheduled tasks in a format that
people are used to.

`System.Cron` is where all the interesting datatypes live. You will also find
`scheduleMatches`, which you can use to compare a time against a `CronSchedule`
to see if an action needs to be performed.  System.Cron.Parser is where you will
find the parsers `cronSchedule`, `crontabEntry` and `cronTab`. To parse
individual schedules up to full crontab files.


To do anything, you'll need to install cabal-dev with cabal.

To build, run:

    make

To run tests, run:

    make test

If you have inotify-tools, run this to run tests continuously.

    make autotest

To generate docs:

    make docs

## Contributors

* [Simon Hengel](https://github.com/sol)
* [Alberto Valverde](https://github.com/albertov)
