module TableCloth
  class Column
    attr_reader :options, :name

    def initialize(name, options={})
      @name    = name
      @options = options
    end

    def value(object, view, table=nil)
      if options[:proc] && options[:proc].respond_to?(:call)
        view.instance_exec(object, view, &options[:proc])
      else
        object.send(name)
      end
    end

    def human_name
      options[:label] || name.to_s.humanize
    end
  end
end