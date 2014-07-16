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
    File.join(Dir.home, ".gn", name, file)
  end

  def load!
    file = Tempfile.new([PLAN_FILE, ".rb"])
    file.write(File.read(path(PLAN_FILE)))
    file.close

    edit(file)

    if $?.success?
      load file.path
    else
      exit 1
    end
  end

  def editor
    ENV["EDITOR"] || "vi"
  end

  def edit(file)
    system "%s %s" % [editor, file.path]
  end

  def blueprints
    ns_classes(Plan).map do |constant|
      Blueprint.new(self, constant)
    end
  end

  def ns_classes(const)
    @ns_classes ||= []
    const.constants.each do |constant|
      if const.const_get(constant).respond_to? :new
        @ns_classes << const.const_get(constant)
      else
        ns_classes(const.const_get(constant))
      end
    end
    @ns_classes
  end
end