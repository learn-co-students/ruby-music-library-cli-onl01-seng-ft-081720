module Concerns::Findable
    def find_by_name(name_string)
        self.all.find {|klass_instance| klass_instance.name == name_string}
    end

    def find_or_create_by_name(name_string)
        find_by_name(name_string) ? find_by_name(name_string) : create(name_string)
    end
end