# Guns
It has two pipes; got tickets to the show?

A low overhead sh utility to replace [session](http://www.codeforpeople.com/lib/ruby/session/)


## Install

    gem install guns -s http://gemcutter.org

## Flexing

DISCLAIMER:  It's not recommended to use guns in place of you shell
I'm purely using IRB for demonstration

    $ irb -r rubygems -r guns
    >> Guns.sh "ls not-a-dir"
    => ["", "ls: not-a-dir: No such file or directory\n", 1]

The `sh` method returns a tuple containing `stdout`, `stderr`, and `exitstatus`.

### Die hard

    >> Guns.sh! "ls not-a-dir"
    Guns::Failure: ls: not-a-dir: No such file or directory

        from ./lib/guns.rb:50:in `sh!'
        from (irb):3
`sh!` will raise an error on a non-zero exit status

### Environment variables

    >> Guns.sh "echo $FOO", "FOO" => "bar"
    ["bar\n", "", 0]

## Further Reading

If you need more flexability and features, see [Rush](http://github.com/adamwiggins/rush)

TODO:  Replace popen3

## Thanks

[Joe Ruscio](http://github.com/josephruscio) for helping me debug that nasty deadlock

[Ryan Tomayko](http://www.tomayko.com) for [Shotgun](http://github.com/rtomayko/shotgun); where I got started with this

[Adam Wiggins](http://www.tomayko.com) for [Rush](http://github.com/adamwiggins/rush)
