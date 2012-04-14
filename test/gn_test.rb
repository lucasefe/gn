$:.push(File.expand_path("../lib", File.basename(__FILE__)))

require "gn"

TEMPLATE = "class %{model} < Ohm::Model; end"

class Main < Gn::Plan
  def configure
    option "-m", -> model { @model = model }
  end

  def generate
    TEMPLATE % { model: @model }
  end
end

test do
  argv = %w(-m Post)

  assert_equal "class Post < Ohm::Model; end", Main.new(argv).generate
end

test do
  argv = %w()

  assert_equal "class  < Ohm::Model; end", Main.new(argv).generate
end
