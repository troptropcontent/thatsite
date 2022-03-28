# frozen_string_literal: true

module Communication::Todo 
    class Base
        attr_reader :status, :available, :order, :name, :inputs
        def initialize(site)
            @name = find_name
            @site = site
            @inputs = find_inputs
            @status = find_status
            @available = find_availability
            @order = 0
        end

        def self.list(site)
            self.subclasses.map do |klass|
                klass.new(site)
            end
            .sort_by(&:order)
        end

        def to_key
            [name]
        end

        def model_name
            OpenStruct.new param_key: 'todo'
        end

        def to_partial_path
            self.class.name.gsub("::", "/").downcase
        end
        
        private

        def find_status
            case avancement
            when 0
               "not_started"
            when 0...1
               "in_progress" 
            when 1
               "done" 
            end
        end

        def find_name
            self.class.name.demodulize.downcase
        end

        def avancement
            @avancement ||= @site.id ? @inputs.filter{|k,v| v.present?}.count.to_f / @inputs.count : 0
        end

        def find_availability
            false
        end

        def find_inputs
            {}
        end
    end
end