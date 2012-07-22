module Plan
  class GemSpec
    def name
      "foo"
    end

    def version
      "0.0.1"
    end

    def description
      "Description of my gem"
    end

    def authors
      ["My Name"]
    end

    def email
      ["my_name@example.com"]
    end

    def homepage
      "http://example.com/"
    end

    def license
      "MIT"
    end

    def destination
      "#{name}.gemspec"
    end
  end
end
