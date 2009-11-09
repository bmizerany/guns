module Guns

  class Failure < StandardError ; end

  def sh(cmd, *args)
    env = args.pop if args.last.kind_of?(Hash)

    rout, wout = IO.pipe
    rerr, werr = IO.pipe

    # Disable GC before forking in an attempt to get some advantage
    # out of COW.

    GC.disable

    if fork
      # Parent
      wout.close
      werr.close

      Process.wait

      exitstatus = $?.exitstatus
      out = rout.read
      err = rerr.read

      rout.close
      rerr.close

      [out, err, exitstatus]
    else
      # Child
      if env
        env.each {|k,v| ENV[k] = v}
      end

      STDOUT.reopen(wout)
      STDERR.reopen(werr)

      $0 = "#$0 -> [guns] #{cmd}"

      system(cmd, *args)

      exit! $?.exitstatus
    end

  ensure
    GC.enable
  end
  module_function :sh

  def sh!(cmd, *args)
    env = args.pop if args.last.kind_of?(Hash)
    env ||= {}
    out, err, code = sh(cmd, *(args + [env]))
    if code != 0
      cmd << " " << args.join(" ") if !args.empty?
      said = []
      said << out if !out.empty?
      said << err if !err.empty?
      said = said.join "\n"
      if !env.empty?
        envs = env.map {|a| a * "=" }.join(" ")
        cmd = envs << " " << cmd
      end
      raise Failure, "(#{cmd})\n#{said}}"
    end
    [out, err, code]
  end
  module_function :sh!

end
