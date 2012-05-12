module Plan
  class Model

    def destination
      "models/#{name.downcase}.rb"
    end

    def name
      "Person"
    end

    def orm
      "Sequel::Model"
    end

    def attributes
      {
        name: :string, 
        email: :string
      }
    end

  end

  class Form
    
    def model
      Model.new
    end

    def destination
      "views/#{model.name.downcase}/form.slim"
    end

  end

  class Route
    
    def model
      Model.new
    end

    def destination
      "routes/#{Model.new.name.downcase}.rb"
    end

  end
end