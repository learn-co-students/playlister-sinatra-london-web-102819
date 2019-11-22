module Slugifiable

    module InstanceMethods
        def slug
            name = self.name.downcase
            name = name.split(" ")
            name.join("-")
        end

    end

    module ClassMethods
        def find_by_slug(slug_name)
            self.all.find{|i| i.slug == slug_name}
        end
    end


end