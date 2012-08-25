class Gn
  module DSL
    def template(constant, dest, &block)
      klass = Class.new
      klass.send(:define_method, :destination) { dest }
      klass.class_eval(&block) if block_given?
      self.const_set constant, klass
    end
  end
end
