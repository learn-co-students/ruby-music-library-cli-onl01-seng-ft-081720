require 'pry'
require 'bundler'
Bundler.require

module Concerns
    module Findable
        # def create(name)

        # end

        def find_by_name(name)
            self.all.detect{|thing| thing.name == name}
        end

        def find_or_create_by_name(name)
            object = self.find_by_name(name)
            object ||= self.create(name) 
        end
    end
end

require_all 'lib'
