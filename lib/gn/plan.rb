require "clap"

class Gn
  class Plan
    attr :options

    def initialize(argv)
      @options = Hash.new
      @path = STDOUT

      option "-O", -> path { @path = File.new(path, "w") }

      configure
      parse(argv)
    end

    def option(flag, procedure)
      options.store(flag, procedure)
    end

    def parse(argv)
      @params = Clap.run(argv, options)
    end

    def write!
      @path.write(generate)
    end
  end
end
