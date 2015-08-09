load "bin/gn"

Dir.chdir("test") do
  test do
    gn = Gn.new("foobar")

    assert_equal gn.name, "foobar"
    assert gn.path("plan.rb").match /\/Users\/\w+\/.gn\/foobar\/plan.rb/
  end

  setup do
    gn = Gn.new("gemspec")

    # Stub path to file.
    def gn.path(file)
      "gemspec/%s" % file
    end

    # Stub edit command.
    def gn.edit(file)
      system "true"
    end

    gn
  end

  test do |gn|
    assert_equal "gemspec/plan.rb", gn.path("plan.rb")
  end

  test do |gn|
    gn.load!

    blueprint = gn.blueprints.first

    assert_equal blueprint.destination, "foo.gemspec"

    result = blueprint.render

    assert result[%Q(  s.name              = "foo")]
    assert result[%Q(  s.version           = "0.0.1")]
    assert result[%Q(  s.summary           = "Description of my gem")]
    assert result[%Q(  s.description       = "Description of my gem")]
    assert result[%Q(  s.authors           = ["My Name"])]
    assert result[%Q(  s.email             = ["my_name@example.com"])]
    assert result[%Q(  s.homepage          = "http://example.com/")]
    assert result[%Q(  s.files             = [)]
    assert result[%Q(  s.license           = "MIT")]
  end
end
