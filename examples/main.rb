# if ARGV.empty?
#   help
# else
#   Main.new(argv).write!
# end

class Main < Gn::Plan

@template = <<-EOS
class %<model>s < Ohm::Model
%<attributes>s
end
EOS

  def configure
    option "-m", -> model { @model = model }
  end

  def generate
    @template % { model: @model, attributes: @params.collect {} }
  end
end

# assert_equal "attributes: [\"title:string\", \"body:string\"]", Main.new(%w(-m Post title:string body:string)).generate!