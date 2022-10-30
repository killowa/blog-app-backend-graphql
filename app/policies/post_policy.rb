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

    def update?
        return record.user.id == user.id
    end
end