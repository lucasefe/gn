require "mote"
require "tempfile"

class Gn
  class Blueprint
    def initialize(parent, constant)
      @parent   = parent
      @instance = constant.new
      @name     = constant.name
    end

    def destination
      @instance.destination
    end

    def file
      File.join(@name.downcase.split("::")) + ".mote"
    end

    def template
      File.read(@parent.path(file))
    end

    def render
      Mote.parse(template, @instance).call
    end
  end

  PLAN_FILE = "plan.rb"

  attr :name

  def initialize(name)
    @name = name
  end

  def path(file)
    "#{ENV["HOME"]}/.gn/#{name}/#{file}"
  end

  def load!
    file = Tempfile.new(PLAN_FILE)
    file.write(File.read(path(PLAN_FILE)))
    file.close

    edit(file)

    load file.path
  end

  def editor
    ENV["EDITOR"] || "vi"
  end

  def edit(file)
    system "%s %s" % [editor, file.path]
  end

  def blueprints
    Plan.constants.map do |constant|
      Blueprint.new(self, Plan.const_get(constant))
    end
  end
end
