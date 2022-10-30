class PostPolicy < ApplicationPolicy

    class Scope < Scope
        def resolve
            if user.admin?
                scope.all
            else
                user.posts
            end
        end
    end

    def udate?
        return false
    end
end